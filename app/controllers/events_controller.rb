class EventsController < ApplicationController
  include ActionController::Live

  def index
    ActiveRecord::Base.clear_active_connections!

    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = ActionController::Live::SSE.new(response.stream)

    user_id = params[:id]
    reporter_id = params[:reporter_id]

    begin
      loop do
        # ref: http://adamnengland.com/2014/08/14/avoiding-caching-with-rails-activerecord/
        # ref: TODO: update http://stackoverflow.com/a/6934740/577298
        Event.uncached do
          events = Event.where(reporter_id: reporter_id, broadcast: false)
          if events.any?
            events.each do |event|
              data = {}
              data[:time] = event.created_at.localtime.strftime('%a, %h %d at %r')
              data[:type] = event.type
              sse.write(data, event: 'event')
            end
            events.update_all(broadcast: true)
          else
            sse.write(Time.now, event: 'heartbeat') # send heartbeat
          end
        end
        sleep 5
      end
    rescue ActionController::Live::ClientDisconnected
      logger.info("[SSE] #{sse} client disconnect.")
    ensure
      sse.close
    end

    render nothing: true
  end
end

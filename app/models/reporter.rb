require 'chronic_duration'

class Reporter < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  def ascending_events
    events.sort_by(&:created_at).reverse
  end

  def latest_event
    ascending_events.first
  end

  def next_reminder
    if latest_event.instance_of?(Checkin) \
      or latest_event.instance_of?(Join) \
      or latest_event.instance_of?(Notification) \
      or latest_event.instance_of?(Optin)
      latest_event.created_at + ChronicDuration.parse(interval)
    end
  end
end

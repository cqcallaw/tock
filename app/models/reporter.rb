require 'chronic_duration'

class Reporter < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  has_one :task, dependent: :destroy
  after_initialize :init
  validates :timezone, presence: true

  def ascending_events
    events.sort_by(&:created_at).reverse
  end

  def paginated_ascending_events(page_id)
    Event.where(reporter_id: id).paginate(page: page_id).order('created_at DESC')
  end

  def latest_event
    ascending_events.first
  end

  def time_interval
    ChronicDuration.parse(interval.to_s + ' ' + interval_units)
  end

  def next_reminder
    if latest_event.instance_of?(Checkin) || latest_event.instance_of?(Join) || latest_event.instance_of?(Notification) || latest_event.instance_of?(Optin)
      latest_event.created_at + time_interval
    end
  end

  def notification_time
    Time.now + time_interval
  end

  def checkin_url(root_url)
    root_url + 'checkins/' + uuid
  end

  def init
    self.uuid = SecureRandom.uuid if uuid.nil?
  end
end

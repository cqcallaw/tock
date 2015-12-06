class Reporter < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  def ascending_events
    events.sort_by(&:created_at).reverse
  end
end

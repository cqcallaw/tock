class Event < ActiveRecord::Base
  belongs_to :reporter
  self.per_page = 10
end

class Task < ActiveRecord::Base
  belongs_to :reporter
  def execute
    raise "SubClassResponsibility"
  end
end

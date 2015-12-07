class ReminderTask < Task
  def execute
    logger.debug('Executing reminder task')
    logger.debug('Finished execution of reminder task')
  end
end

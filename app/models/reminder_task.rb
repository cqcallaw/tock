class ReminderTask < Task
  def execute
    logger.debug('Executing reminder task')
    Mailer.reminder(self).deliver_now
    logger.debug('Finished execution of reminder task')
  end
end

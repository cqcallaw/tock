class NotifyTask < Task
  def execute
    logger.debug('Executing notification task')
    Mailer.notification(self).deliver_now
    logger.debug('Finished execution of notification task')
  end
end

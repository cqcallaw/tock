class NotifyTask < Task
  def execute
    logger.debug('Executing notification task')
    logger.debug('Finished execution of notification task')
  end
end

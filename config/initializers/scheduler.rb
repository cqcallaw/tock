require 'rufus-scheduler'
require 'chronic_duration'

scheduler = Rufus::Scheduler.new

scheduler.every '5s' do
  # produce notification or reminder tasks
  User.all.each do |user|
    user.reporters.all.each do |reporter|
      interval = Time.now - reporter.latest_event.created_at
      Rails.logger.debug("Reporter name: #{reporter.name}")
      Rails.logger.debug("Reporter time_interal: #{reporter.time_interval}")
      Rails.logger.debug("Reporter latest event type: #{reporter.latest_event.class.name}")
      Rails.logger.debug("Reporter latest_event.created_at: #{reporter.latest_event.created_at}")
      Rails.logger.debug("Interval: #{interval}")
      Rails.logger.debug("Reporter task: #{reporter.task}")
      unless reporter.task.nil?
        Rails.logger.debug("Reporter task type: #{reporter.task.class.name}")
      end

      unless reporter.latest_event.instance_of?(Invite) || reporter.latest_event.instance_of?(Notification) || reporter.latest_event.instance_of?(Optout)
        # our reporter might need a reminder or notification
        if interval > reporter.time_interval && reporter.task.nil?
          if reporter.latest_event.instance_of?(Reminder)
            # push notification task onto task queue
            # only push one task per reporter
            Rails.logger.debug("Enqueuing notification task for #{reporter.name} of user #{user.id}")
            reporter.task = NotifyTask.create
            Rails.logger.debug('Finished enqueuing of notification task')
          elsif interval > reporter.time_interval && reporter.task.nil?
            # push reminder task onto task queue
            # only push one task per reporter
            Rails.logger.debug("Enqueuing reminder task for #{reporter.name} of user #{user.id}")
            reporter.task = ReminderTask.create
            Rails.logger.debug('Finished enqueuing of reminder task')
          end
        else
          Rails.logger.debug("No action required for reporter #{reporter.name}")
        end
      end
    end
  end
end

scheduler.every '10s' do
  # consume tasks
  Task.all.each do |task|
    if task.instance_of?(ReminderTask)
      Rails.logger.debug('Dequeuing reminder task')
      reminder = Reminder.create(reporter: task.reporter)
      task.reporter.events.push(reminder)
      task.reporter.task = nil
      task.destroy
      Rails.logger.debug('Finished processing reminder task')
    elsif task.instance_of?(NotifyTask)
      Rails.logger.debug('Dequeuing notification task')
      reminder = Notification.create(reporter: task.reporter)
      task.reporter.events.push(reminder)
      task.reporter.task = nil
      task.destroy
      Rails.logger.debug('Finished processing notification task')
    end
  end
end

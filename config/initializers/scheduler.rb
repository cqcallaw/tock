require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '5s' do
  # produce notification or reminder tasks
  User.all.each do |user|
    user.reporters.all.each do |reporter|
      interval = Time.now - reporter.latest_event.created_at
      Rails.logger.debug("[Producer] Reporter name: #{reporter.name}")
      Rails.logger.debug("[Producer] Reporter time_interal: #{reporter.time_interval}")
      Rails.logger.debug("[Producer] Reporter latest event type: #{reporter.latest_event.class.name}")
      Rails.logger.debug("[Producer] Reporter latest_event.created_at: #{reporter.latest_event.created_at}")
      Rails.logger.debug("[Producer] Interval: #{interval}")
      Rails.logger.debug("[Producer] Reporter task: #{reporter.task}")
      unless reporter.task.nil?
        Rails.logger.debug("[Producer] Reporter task type: #{reporter.task.class.name}")
      end

      unless reporter.latest_event.instance_of?(Invite) || reporter.latest_event.instance_of?(Notification) || reporter.latest_event.instance_of?(Optout)
        # our reporter might need a reminder or notification
        if interval > reporter.time_interval && reporter.task.nil?
          if reporter.latest_event.instance_of?(Reminder)
            # push notification task onto task queue
            # only push one task per reporter
            Rails.logger.debug("[Producer] Enqueuing notification task for #{reporter.name} of user #{user.id}")
            reporter.task = NotifyTask.create
            Rails.logger.debug('[Producer] Finished enqueuing of notification task')
          elsif interval > reporter.time_interval && reporter.task.nil?
            # push reminder task onto task queue
            # only push one task per reporter
            Rails.logger.debug("[Producer] Enqueuing reminder task for #{reporter.name} of user #{user.id}")
            reporter.task = ReminderTask.create
            Rails.logger.debug('[Producer] Finished enqueuing of reminder task')
          end
        else
          Rails.logger.debug("[Producer] No action required for reporter #{reporter.name}")
        end
      end
    end
  end
end

scheduler.every '10s' do
  # consume tasks
  Task.all.each do |task|
    unless task.processing
      Rails.logger.debug("[Consumer] #{task} Dequeuing")
      begin
        task.processing = true # flag this task as being processed
        task.save

        Rails.logger.debug("[Consumer] #{task} Executing task")
        task.execute
        Rails.logger.debug("[Consumer] #{task} Finished executing task")

        if task.instance_of?(ReminderTask)
          Reminder.create(reporter: task.reporter)
        elsif task.instance_of?(NotifyTask)
          Notification.create(reporter: task.reporter)
        end

        Rails.logger.debug("[Consumer] #{task} Destroying task")
        task.reporter.task = nil
        task.destroy
        Rails.logger.debug("[Consumer] #{task} Finished destroying task")
      rescue Exception => e
        if task.attempts > 2
          Rails.logger.debug('[Consumer] #{task} More than 3 attempts made, deleting task')
          task.reporter.task = nil
          task.destroy
          Rails.logger.debug("[Consumer] #{task} Finished deleting task")
        else
          Rails.logger.debug("[Consumer] #{task} Error: " + e.to_s)
          Rails.logger.debug("[Consumer] #{task} Task attempt failed; re-enqueuing")
          task.attempts += 1
          task.processing = false
          task.save
          Rails.logger.debug("[Consumer] #{task} Finished re-enqueuing task")
        end
      end
      Rails.logger.debug("[Consumer] #{task} Finished processing")
    end
  end
end

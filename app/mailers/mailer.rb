class Mailer < ApplicationMailer
  before_action :setup
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.reminder.subject
  #
  def reminder(task)
    @task = task
    @notification_time = @task.reporter.notification_time
    mail to: task.reporter.email, subject: '[tock] Checkin Reminder'
  end

  def notification(task)
    @task = task
    @last_event_time = @task.reporter.latest_event.created_at
    mail to: task.reporter.user.email, subject: '[tock] Inactivity Notification'
  end

  def invite(reporter)
    @reporter = reporter
    mail from: reporter.user.email, to: reporter.email, subject: '[tock] Welcome to Tock!'
  end

  def setup
    @greeting = 'Hi'
    @time_format_string = '%a, %h %d at %r %Z'
  end
end

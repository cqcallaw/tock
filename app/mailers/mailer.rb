class Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.reminder.subject
  #
  def reminder(task)
    @greeting = "Hi"
    @task = task
    mail to: task.reporter.email, subject: "Checkin Reminder"
  end
end

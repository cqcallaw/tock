class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :open_access?

  def open_access?
    (controller_name == 'registrations' and action_name == 'new') \
    or (controller_name == 'sessions' and action_name == 'new') \
    or (controller_name == 'passwords' and action_name == 'new') \
    or (controller_name == 'checkins' and action_name == 'new')
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :timezone
    devise_parameter_sanitizer.for(:account_update) << :timezone
  end

  def authenticate!
    # use the devise authenticate to make sure a user is signed in
    # Could customize by checking for each controller/action pair
    return if controller_name == 'checkins'

    authenticate_user!

    # only allow a user to edit/update or delete reporters created by the user
    if controller_name == 'reporter' && (action_name == 'edit' || action_name == 'update' || action_name == 'destroy')
      current_rating = Reporter.find(params[:reporter_id])

      if reporter.user_id == current_user.id
        return
      else
        # by redirecting here, we are preventing the user from visiting the requested page
        redirect_to root_url, notice: 'Record not found'
      end
    end
 end
end

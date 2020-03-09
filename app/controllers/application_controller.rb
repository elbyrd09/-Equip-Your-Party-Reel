class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  # For Pundit
  after_action :verify_authorized, except: [:index], unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # For Devise
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location])
  end

  private

  # Uncomment when you *really understand* Pundit!
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

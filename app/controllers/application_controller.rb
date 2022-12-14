class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  after_action :verify_authorized, :except => :index, unless: :devise_controller?
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name full_name admin email password])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name full_name admin email password avatar])
  end

  private

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_root_path
    else
      apartaments_path
    end
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^condos$)/
  end

# def authenticate_user!
#   if user_signed_in?
#     if current_user.admin?
#       redirect_to admin_root_path
#     else
#       redirect_to apartaments_path
#     end
#   end
# end
end

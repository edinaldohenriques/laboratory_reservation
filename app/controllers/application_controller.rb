class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  around_action :switch_locale

  private
  
  def default_url_options
    { locale: I18n.locale }
  end


  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def user_not_authorized
    flash[:alert] = "Você não tem autorização para acessar essa página!"
    redirect_to(request.referrer || root_path)
  end
end

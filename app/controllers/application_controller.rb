class ApplicationController < ActionController::Base
  around_action :switch_locale

  def authorize_auditor!
    redirect_to '/422.html' if session[:current_auditor_id].blank?
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end

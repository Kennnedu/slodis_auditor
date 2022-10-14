class SessionController < ApplicationController
  def show
    auditor = Auditor.authenticate(params[:token])
    session[:current_auditor_id] = auditor.id
    session[:current_auditor_name] = auditor.name
    redirect_to products_path
  end
end

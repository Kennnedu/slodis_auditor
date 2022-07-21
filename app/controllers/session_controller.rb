class SessionController < ApplicationController
  def show
    auditor = Auditor.authenticate(params[:token])
    session[:current_auditor_id] = auditor.id
    redirect_to products_path
  end
end

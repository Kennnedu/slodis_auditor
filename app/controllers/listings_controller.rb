class ListingsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_inventory

  def show
    @products = @inventory.products.includes(:product_kind, :auditor).all.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'listing', template: 'listings/show.html.slim', encoding: 'UTF-8'
      end
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end

class ListingsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_inventory

  def show
    @products = @inventory.products.includes(:product_kind).all.order(created_at: :desc)
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end

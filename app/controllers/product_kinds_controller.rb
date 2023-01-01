class ProductKindsController < ApplicationController
  before_action :authorize_auditor!

  def index
    scope = ProductKind.all

    if params[:barcode]
      scope = scope.where(barcode: params[:barcode])
    end

    @product_kinds = scope
  end
end

class ProductKindsController < ApplicationController
  LIMIT = 30.freeze

  before_action :authorize_auditor!

  def index
    scope = ProductKind.all.limit(LIMIT)

    if params[:barcode]
      scope = scope.search_by_barcode(params[:barcode])
    end

    @product_kinds = scope
  end
end

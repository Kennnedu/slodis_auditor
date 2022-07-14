class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_inventory, only: %i[ index new create listing ]

  # GET /products or /products.json
  def index
    @page_title = t('.title')
    @products = @inventory.products.select('products.id, products.barcode, products.amount, row_number() over(order by products.created_at asc)').order('row_number desc')
  end

  def listing
    @page_title = t('.title')
    @products = @inventory.products.all.order(created_at: :desc)
  end

  # GET /products/1 or /products/1.json
  def show
    @page_title = @product.barcode
  end

  # GET /products/new
  def new
    @page_title = t('.title')
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @page_title = t('.title', barcode: @product.barcode)
  end

  # POST /products or /products.json
  def create
    @product = @inventory.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to new_inventory_product_path(@inventory), notice: t('.success', product: @product.barcode) }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: t('.success', product: @product.barcode) }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to inventory_products_path(@product.inventory_id), notice: t('.success', product: @product.barcode) }
      format.json { head :no_content }
    end
  end

  private
    def set_inventory
      @inventory = Inventory.find(params[:inventory_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:barcode, :amount)
    end
end

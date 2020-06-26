class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.where(id: params[:id]).first
    if @product
      render json: @product, status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  # POST /products
  # POST /products.json
  def create
    if Store.exists?(Store.where(id: params[:store_id]))
      @product = Product.new(product_params)
      if @product.save
        render json: ['Data Created', @product], status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    else
      render json: ['No store_id match in store database'], status: :not_found
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.where(id: params[:id]).first
    if Store.exists?(Store.where(id: params[:store_id]))
      if @product
        @product.update(product_params)
        if @product.save
          render json: ['Data Updated', @product], status: :ok
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      else
        render json: ['No ID match in database'], status: :not_found
      end
    else
      render json: ['No store_id match in store database'], status: :not_found
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.where(id: params[:id]).first
    if @product
      @product.destroy
      render json: ['Data Deleted'], status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:name, :price, :store_id)
    end
end

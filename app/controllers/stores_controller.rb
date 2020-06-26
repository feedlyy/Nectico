class StoresController < ApplicationController
  # before_action :set_store, only: [:show, :edit, :update, :destroy, :create]

  # GET /stores
  # GET /stores.json
  def index
    @store = Store.all
    render json: @store, status: :ok
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.where(id: params[:id]).first
    if @store
      render json: @store, status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    if @store.save
      render json: ['Data Created', @store], status: :created
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    @store = Store.where(id: params[:id]).first
    if @store
      @store.update(store_params)
      if @store.save
        render json: ['Data Updated', @store], status: :ok
      else
        render json: @store.errors, status: :unprocessable_entity
      end
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store = Store.where(id: params[:id]).first
    if @store
      @store.destroy
      render json: ['Data Deleted'], status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  private
    # Only allow a list of trusted parameters through.
  def store_params
    # params.require(:store).params.permit(:name, :phone)
    params.permit(:name, :phone)
  end
end

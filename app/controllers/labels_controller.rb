class LabelsController < ApplicationController
  # before_action :set_label, only: [:show, :edit, :update, :destroy]

  # GET /labels
  # GET /labels.json
  def index
    paginate Label.unscoped, per_page: 5
  end

  # GET /labels/1
  # GET /labels/1.json
  def show
    @label = Label.where(id: params[:id]).first
    if @label
      render json:  @label, status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  # POST /labels
  # POST /labels.json
  def create
    if Product.exists?(Product.where(id: params[:product_id]))
      @label = Label.new(label_params)
      if @label.save
        render json: ['Data Created', @label], status: :created
      else
        render json: @label.errors, status: :unprocessable_entity
      end
    else
      render json: ['No product_id match in product database'], status: :not_found
    end
  end

  # PATCH/PUT /labels/1
  # PATCH/PUT /labels/1.json
  def update
    @label = Label.where(id: params[:id]).first
    if Product.exists?(Product.where(id: params[:product_id]))
      if @label
        @label.update(label_params)
        if @label.save
          render json: ['Data Updated', @label], status: :ok
        else
          render json: @label.errors, status: :unprocessable_entity
        end
      else
        render json: ['No ID match in database'], status: :not_found
      end
    else
      render json: ['No product_id match in product database'], status: :not_found
    end
  end

  # DELETE /labels/1
  # DELETE /labels/1.json
  def destroy
    @label = Label.where(id: params[:id]).first
    if @label
      @label.destroy
      render json: ['Data Deleted'], status: :ok
    else
      render json: ['No ID match in database'], status: :not_found
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def label_params
      params.permit(:name, :product_id)
    end
end

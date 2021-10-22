class PrimaryModelsController < ApplicationController
  before_action :set_primary_model, only: %i[ show edit update destroy ]

  # GET /primary_models or /primary_models.json
  def index
    @primary_models = PrimaryModel.all
  end

  # GET /primary_models/1 or /primary_models/1.json
  def show
  end

  # GET /primary_models/new
  def new
    @primary_model = PrimaryModel.new
  end

  # GET /primary_models/1/edit
  def edit
  end

  # POST /primary_models or /primary_models.json
  def create
    @primary_model = PrimaryModel.new(primary_model_params)

    respond_to do |format|
      if @primary_model.save
        format.html { redirect_to @primary_model, notice: "Primary model was successfully created." }
        format.json { render :show, status: :created, location: @primary_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @primary_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /primary_models/1 or /primary_models/1.json
  def update
    respond_to do |format|
      if @primary_model.update(primary_model_params)
        format.html { redirect_to @primary_model, notice: "Primary model was successfully updated." }
        format.json { render :show, status: :ok, location: @primary_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @primary_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primary_models/1 or /primary_models/1.json
  def destroy
    @primary_model.destroy
    respond_to do |format|
      format.html { redirect_to primary_models_url, notice: "Primary model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_primary_model
      @primary_model = PrimaryModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def primary_model_params
      params.require(:primary_model).permit(:name)
    end
end

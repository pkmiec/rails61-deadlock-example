class OtherModelsController < ApplicationController
  before_action :set_other_model, only: %i[ show edit update destroy ]

  # GET /other_models or /other_models.json
  def index
    @other_models = OtherModel.all
  end

  # GET /other_models/1 or /other_models/1.json
  def show
  end

  # GET /other_models/new
  def new
    @other_model = OtherModel.new
  end

  # GET /other_models/1/edit
  def edit
  end

  # POST /other_models or /other_models.json
  def create
    @other_model = OtherModel.new(other_model_params)

    respond_to do |format|
      if @other_model.save
        format.html { redirect_to @other_model, notice: "Other model was successfully created." }
        format.json { render :show, status: :created, location: @other_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_models/1 or /other_models/1.json
  def update
    respond_to do |format|
      if @other_model.update(other_model_params)
        format.html { redirect_to @other_model, notice: "Other model was successfully updated." }
        format.json { render :show, status: :ok, location: @other_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_models/1 or /other_models/1.json
  def destroy
    @other_model.destroy
    respond_to do |format|
      format.html { redirect_to other_models_url, notice: "Other model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_model
      @other_model = OtherModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_model_params
      params.require(:other_model).permit(:name)
    end
end

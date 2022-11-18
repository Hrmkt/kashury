class HousepicturesController < ApplicationController
  before_action :set_housepicture, only: %i[ show edit update destroy ]

  # GET /housepictures or /housepictures.json
  def index
    @housepictures = Housepicture.all
  end

  # GET /housepictures/1 or /housepictures/1.json
  def show
  end

  # GET /housepictures/new
  def new
    @housepicture = Housepicture.new
  end

  # GET /housepictures/1/edit
  def edit
  end

  # POST /housepictures or /housepictures.json
  def create
    @housepicture = Housepicture.new(housepicture_attributes)

    respond_to do |format|
      if @housepicture.save
        format.html { redirect_to house_url(@housepicture.house_id), notice: "Housepicture was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /housepictures/1 or /housepictures/1.json
  def update
    respond_to do |format|
      if @housepicture.update(housepicture_attributes)
        format.html { redirect_to housepicture_url(@housepicture), notice: "Housepicture was successfully updated." }
        format.json { render :show, status: :ok, location: @housepicture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @housepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housepictures/1 or /housepictures/1.json
  def destroy
    house_id = @housepicture.house.id
    @housepicture.destroy

    respond_to do |format|
      format.html { redirect_to house_url(house_id), notice: "Housepicture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_image
    housepicture = Housepicture.find(params[:id])
    send_data(housepicture.photo, disposition: :inline)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housepicture
      @housepicture = Housepicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def housepicture_params
      params.require(:housepicture).permit(:name, :photo, :house_id)
    end

    def housepicture_attributes
      if housepicture_params[:photo].blank?
        {
          name: housepicture_params[:name], house_id: housepicture_params[:house_id]
        }
      else
      {
        name: housepicture_params[:name], photo: housepicture_params[:photo].read, house_id: housepicture_params[:house_id]
      }
      end
    end
end

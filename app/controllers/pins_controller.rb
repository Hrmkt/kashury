class PinsController < ApplicationController
  before_action :require_login
  before_action :set_pin, only: %i[ show edit update destroy ]

  # GET /pins or /pins.json
  def index
    @pins = Pin.all
  end

  # GET /pins/1 or /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins or /pins.json
  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        if request.referer&.include?("/houses/")
          format.html { redirect_to house_url(@pin.house_id), notice: "Pin was successfully created." }
        else
          format.html { redirect_to houses_url(anchor: @pin.house_id), notice: "Pin was successfully created." }
        end
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1 or /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to pin_url(@pin), notice: "Pin was successfully updated." }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1 or /pins/1.json
  def destroy
    @pin.destroy

    respond_to do |format|
      if request.referer&.include?("/houses/")
        format.html { redirect_to house_url(house_id), notice: "Pin was successfully destroyed." }
      else
        format.html { redirect_to houses_url(anchor: @pin.house_id), notice: "Pin was successfully destroyed." }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pin_params
      params.require(:pin).permit(:user_id, :house_id)
    end
end

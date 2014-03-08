class BedsController < ApplicationController
  before_action :set_bed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /beds
  # GET /beds.json
  def index
    @beds = current_user.beds
  end

  # GET /beds/1
  # GET /beds/1.json
  def show
    @bed = Bed.find(params[:id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @availability = Availability.new(params[:id]).availability
  end

  # GET /beds/new
  def new
    @bed = current_user.days.build
  end

  # GET /beds/1/edit
  def edit
  end

  # POST /beds
  # POST /beds.json
  def create
    @bed = current_user.days.new(bed_params)

    respond_to do |format|
      if @bed.save
        format.html { redirect_to @bed, notice: 'Bed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bed }
      else
        format.html { render action: 'new' }
        format.json { render json: @bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beds/1
  # PATCH/PUT /beds/1.json
  def update
    respond_to do |format|
      if @bed.update(bed_params)
        format.html { redirect_to @bed, notice: 'Bed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beds/1
  # DELETE /beds/1.json
  def destroy
    @bed.destroy
    respond_to do |format|
      format.html { redirect_to beds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bed
      @bed = Bed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bed_params
      params.require(:bed).permit(:start_date, :end_date, :price, :quantity, :name, :description, :image, :max_bookable, :max_days_before, :payment_method, :user_id)
    end
end

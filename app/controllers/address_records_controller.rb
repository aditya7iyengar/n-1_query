class AddressRecordsController < ApplicationController
  before_action :set_address_record, only: [:show, :edit, :update, :destroy]

  # GET /address_records
  # GET /address_records.json
  def index
    @address_records = AddressRecord.all
  end

  # GET /address_records/1
  # GET /address_records/1.json
  def show
  end

  # GET /address_records/new
  def new
    @address_record = AddressRecord.new
  end

  # GET /address_records/1/edit
  def edit
  end

  # POST /address_records
  # POST /address_records.json
  def create
    @address_record = AddressRecord.new(address_record_params)

    respond_to do |format|
      if @address_record.save
        format.html { redirect_to @address_record, notice: 'Address record was successfully created.' }
        format.json { render :show, status: :created, location: @address_record }
      else
        format.html { render :new }
        format.json { render json: @address_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_records/1
  # PATCH/PUT /address_records/1.json
  def update
    respond_to do |format|
      if @address_record.update(address_record_params)
        format.html { redirect_to @address_record, notice: 'Address record was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_record }
      else
        format.html { render :edit }
        format.json { render json: @address_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_records/1
  # DELETE /address_records/1.json
  def destroy
    @address_record.destroy
    respond_to do |format|
      format.html { redirect_to address_records_url, notice: 'Address record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_record
      @address_record = AddressRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_record_params
      params.fetch(:address_record, {})
    end
end

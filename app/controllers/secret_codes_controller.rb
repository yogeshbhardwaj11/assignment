class SecretCodesController < ApplicationController
  load_and_authorize_resource
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]

  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.all
  end

  # GET /secret_codes/1
  # GET /secret_codes/1.json
  def show
  end

  # GET /secret_codes/new
  def new
    @secret_code = SecretCode.new
  end

  # GET /secret_codes/1/edit
  def edit
  end

  # POST /secret_codes
  # POST /secret_codes.json
  def create
    @secret_code = SecretCode.new
    respond_to do |format|
      begin
        (1..params[:count].to_i).each do |index|
          SecretCode.create(code: SecureRandom.hex)
        end
        format.html { redirect_to @secret_code, notice: 'Secret codes were successfully created.' }
        format.json { render :show, status: :created, location: @secret_code }
      rescue => e
        format.html { render :new }
        format.json { render json: e.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secret_codes/1
  # DELETE /secret_codes/1.json
  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret_code
      @secret_code = SecretCode.find(params[:id])
    end
end

class ApplicationSetupsController < ApplicationController
  before_action :set_application_setup, only: [:show, :edit, :update, :destroy]
  before_action :log_in_user

  # GET /application_setups
  # GET /application_setups.json
  def index
    @application_setups = ApplicationSetup.all
  end

  # GET /application_setups/1
  # GET /application_setups/1.json
  def show
  end

  # GET /application_setups/new
  def new
    @application_setup = ApplicationSetup.new
  end

  # GET /application_setups/1/edit
  def edit
  end

  # POST /application_setups
  # POST /application_setups.json
  def create
    @application_setup = ApplicationSetup.new(application_setup_params)

    respond_to do |format|
      if @application_setup.save
        format.html { redirect_to @application_setup, notice: 'Application setup was successfully created.' }
        format.json { render :show, status: :created, location: @application_setup }
      else
        format.html { render :new }
        format.json { render json: @application_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /application_setups/1
  # PATCH/PUT /application_setups/1.json
  def update
    respond_to do |format|
      if @application_setup.update(application_setup_params)
        format.html { redirect_to @application_setup, notice: 'Application setup was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_setup }
      else
        format.html { render :edit }
        format.json { render json: @application_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_setups/1
  # DELETE /application_setups/1.json
  def destroy
    @application_setup.destroy
    respond_to do |format|
      format.html { redirect_to application_setups_url, notice: 'Application setup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_setup
      @application_setup = ApplicationSetup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_setup_params
      params.require(:application_setup).permit(:app_setup_type_id, :language_id, :code_id, :description, :str_value)
    end
end

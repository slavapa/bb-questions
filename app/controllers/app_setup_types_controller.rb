class AppSetupTypesController < ApplicationController
  before_action :set_app_setup_type, only: [:show, :edit, :update, :destroy]
  before_action :log_in_user

  # GET /app_setup_types
  # GET /app_setup_types.json
  def index
    @app_setup_types = AppSetupType.all
  end

  # GET /app_setup_types/1
  # GET /app_setup_types/1.json
  def show
  end

  # GET /app_setup_types/new
  def new
    @app_setup_type = AppSetupType.new
  end

  # GET /app_setup_types/1/edit
  def edit
  end

  # POST /app_setup_types
  # POST /app_setup_types.json
  def create
    @app_setup_type = AppSetupType.new(app_setup_type_params)

    respond_to do |format|
      if @app_setup_type.save
        format.html { redirect_to @app_setup_type, notice: 'App setup type was successfully created.' }
        format.json { render :show, status: :created, location: @app_setup_type }
      else
        format.html { render :new }
        format.json { render json: @app_setup_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_setup_types/1
  # PATCH/PUT /app_setup_types/1.json
  def update
    respond_to do |format|
      if @app_setup_type.update(app_setup_type_params)
        format.html { redirect_to @app_setup_type, notice: 'App setup type was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_setup_type }
      else
        format.html { render :edit }
        format.json { render json: @app_setup_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_setup_types/1
  # DELETE /app_setup_types/1.json
  def destroy
    @app_setup_type.destroy
    respond_to do |format|
      format.html { redirect_to app_setup_types_url, notice: 'App setup type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_setup_type
      @app_setup_type = AppSetupType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_setup_type_params
      params.require(:app_setup_type).permit(:id, :name, :description)
    end
end

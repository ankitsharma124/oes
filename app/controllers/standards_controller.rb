class StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :edit, :update, :destroy]

  # GET /standards
  # GET /standards.json
  def index
    @standards = Standard.where(:organization_id=> 2)
  end

  # GET /standards/1
  # GET /standards/1.json
  def show
  end

  # GET /standards/new
  def new
    @standard = Standard.new
  end

  # GET /standards/1/edit
  def edit
  end

  # POST /standards
  # POST /standards.json
  def create
    @standard = Standard.new(standard_params)

    @standard[:organization_id] = 2
    respond_to do |format|
      if @standard.save
        format.html { redirect_to @standard, notice: 'Standard was successfully created.' }
        format.json { render :show, status: :created, location: @standard }
      else
        format.html { render :new }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standards/1
  # PATCH/PUT /standards/1.json
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to @standard, notice: 'Standard was successfully updated.' }
        format.json { render :show, status: :ok, location: @standard }
      else
        format.html { render :edit }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standards/1
  # DELETE /standards/1.json
  def destroy
    @standard.destroy
    respond_to do |format|
      format.html { redirect_to standards_url, notice: 'Standard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def standard_params
      params.fetch(:standard, {}).permit(:name, :organization_id)
    end
end

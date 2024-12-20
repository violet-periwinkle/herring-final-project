class ColorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_color, only: %i[ show edit update destroy ]

  # GET /colors or /colors.json
  def index
    @colors = Color.all
  end

  # GET /colors/1 or /colors/1.json
  def show
  end
  
  # GET /colors/new
  def new
    @color = Color.new(color_params)
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors or /colors.json
  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to edit_palette_path(params[:palette_id]), notice: "Color was successfully created." }
        format.json { render :show, status: :created, location: @color }
      else
        format.html { redirect_to edit_palette_path(params[:palette_id]), status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1 or /colors/1.json
  def update
    respond_to do |format|
      unless @color.update(color_params)
        format.html { redirect_to edit_palette_path(params[:palette_id]), status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1 or /colors/1.json
  def destroy
    @color.destroy!

    respond_to do |format|
      format.html { redirect_to edit_palette_path(params[:palette_id]), status: :see_other, notice: "Color was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @palette = Palette.find(params[:palette_id])
      @color = Color.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def color_params
      params.fetch(:color, {hex_code: '#808080', proportion: 1, palette_id: params[:palette_id]}).permit(:id, :hex_code, :proportion, :palette_id)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_back_or_to palette_path(params[:palette_id])
    end
end

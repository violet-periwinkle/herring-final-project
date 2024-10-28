class PalettesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_palette, only: %i[ show edit update destroy ]

  # GET /palettes or /palettes.json
  def index
    if params[:user_id]
      @palettes = User.find(params[:user_id]).palettes
    else
      @palettes = Palette.all
    end
  end

  # GET /palettes/1 or /palettes/1.json
  def show
  end

  # GET /palettes/new
  def new
    #@current_user.palettes.new(palette_params)
    @palette = Palette.new
    render edit
  end

  # GET /palettes/1/edit
  def edit
  end

  # POST /palettes or /palettes.json
  def create
    @palette = Palette.new(palette_params)

    respond_to do |format|
      if @palette.save
        format.html { redirect_to edit_palette_path(@palette), notice: "Palette was successfully created." }
        format.json { render :show, status: :created, location: @palette }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @palette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /palettes/1 or /palettes/1.json
  def update
    respond_to do |format|
      if @palette.update(palette_params)
        format.html { redirect_to @palette, notice: "Palette was successfully updated." }
        format.json { render :show, status: :ok, location: @palette }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @palette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palettes/1 or /palettes/1.json
  def destroy
    @palette.destroy!

    respond_to do |format|
      format.html { redirect_to palettes_path, status: :see_other, notice: "Palette was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palette
      @palette = Palette.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def palette_params
      params.require(:palette).permit(:title, :user_id, :background, :layout, :spacing, colors_attributes: [:id, :hex_code, :proportion, :palette_id, :_destroy])
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_back_or_to palettes_path
    end
end

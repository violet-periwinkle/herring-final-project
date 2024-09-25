class PalettesController < ApplicationController
  before_action :set_palette, only: %i[ show edit update destroy ]

  # GET /palettes or /palettes.json
  def index
    @palettes = Palette.all
  end

  # GET /palettes/1 or /palettes/1.json
  def show
  end

  # GET /palettes/new
  def new
    @palette = Palette.new
  end

  # GET /palettes/1/edit
  def edit
  end

  # POST /palettes or /palettes.json
  def create
    @palette = Palette.new(palette_params)

    respond_to do |format|
      if @palette.save
        format.html { redirect_to @palette, notice: "Palette was successfully created." }
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
      params.require(:palette).permit(:title, :user_id, :background, :layout, :spacing)
    end
end

class SourcesController < ApplicationController
  before_action :set_source, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /sources or /sources.json
  def index
    @sources = current_user.sources.all
  end

  # GET /sources/1 or /sources/1.json
  def show
    @source = current_user.sources.find(params[:id])
    events = current_user.events.joins(:lead).where('leads.source' => @source)
    @events_breakdown = events.joins(:state).group("states.name").count
    @events_breakdown_sum = events.count
  end

  # GET /sources/new
  def new
    @source = current_user.sources.new
  end

  # GET /sources/1/edit
  def edit
    @source = current_user.sources.find(params[:id])
  end

  # POST /sources or /sources.json
  def create
    @source = current_user.sources.new(source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: "Source was successfully created." }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1 or /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: "Source was successfully updated." }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1 or /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: "Source was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = current_user.sources.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def source_params
      params.require(:source).permit(:name, :startable)
    end
end

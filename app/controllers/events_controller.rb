class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @lead = Lead.find(params[:lead_id])
    @events = @lead.events.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @lead = Lead.find(params[:lead_id])
    @event = @lead.events.new
  end

  # POST /events or /events.json
  def create
    @lead = Lead.find(params[:lead_id])
    @event = @lead.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to lead_path(@lead), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to lead_path(@lead), notice: "Event was not saved." }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @lead = Lead.find(params[:lead_id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to lead_path(@lead), notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :occurred, :state_id, :lead_id, :person, :notes)
    end
end

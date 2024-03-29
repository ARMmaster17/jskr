class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /leads or /leads.json
  def index
    @leads = current_user.leads.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /leads/1 or /leads/1.json
  def show
    @lead = current_user.leads.find(params[:id])
  end

  # GET /leads/new
  def new
    @lead = current_user.leads.new
  end

  # GET /leads/1/edit
  def edit
    @lead = current_user.leads.find(params[:id])
  end

  # POST /leads or /leads.json
  def create
    @lead = current_user.leads.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to @lead, notice: "Lead was successfully created." }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = current_user.leads.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:company, :position, :source_id, :location, :notes)
    end
end

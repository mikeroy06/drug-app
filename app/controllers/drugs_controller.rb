class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /drugs
  # GET /drugs.json
  def index
   if params[:search]
      @drugs = Drug.search(params[:search]).order("condition ASC, subcategory ASC, drug ASC")

    else
      # @drugs = Drug.order("condition ASC")
      # @drugs = Drug.order("created_at DESC")
      @drugs = Drug.order("condition ASC, subcategory ASC, drug ASC")
    end
end

  # GET /drugs/1
  # GET /drugs/1.json
  def show

  end

  

  # GET /drugs/new
  def new
    @drug = current_user.drugs.build
  end

  # GET /drugs/1/edit
  def edit
  end


  # POST /drugs
  # POST /drugs.json
  def create
    @drug = current_user.drugs.build(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: @drug }
      else
        format.html { render :new }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_params
      params.require(:drug).permit(:condition, :subcategory, :drug)
    end
end

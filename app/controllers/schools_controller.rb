class SchoolsController < ApplicationController

  # GET /schools
  def index
    @schools = Schools.all
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new - create in memory and render form
  def new
    @school = school.new
  end

  # GET /schools/edit - renders form
  def edit
  end

  # POST /schools
  def create
    @school = school.new(school_params)
    if @school.save
      redirect_to @school
    else
      render :new
  end


  # DELETE /schools
  def destroy
    @school.destroy
    redirect_to schools_url
  end

  private
    def find_school
      @school = Schools.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def school_params
      params.require(:school).permit(:name, :address, :capacity, :principal, :private_school)
    end

end

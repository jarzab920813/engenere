class FleetsController < ApplicationController

	def index
 		@fleets =Fleet.all
		
 	end

 	def show
 		@fleet =Fleet.find(params[:id])
  end

  def new
  	@fleet = Fleet.new
  end

  def create
  	@fleet = Fleet.new(fleet_params)
	  @fleet.save

  	redirect_to @fleet
  end	

  def edit
  	@fleet = Fleet.find(params[:id])
  end
  def update
	  @fleet = Fleet.find(params[:id])
	 
	  if @fleet.update(fleet_params)
	    redirect_to @fleet
	  else
	    render 'edit'
	  end
	end

  def fleet_params
  	params.require(:fleet).permit(:name)
  end


end

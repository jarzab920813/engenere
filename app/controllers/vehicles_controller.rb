class VehiclesController < ApplicationController


	def index
		@vehicles = Vehicle.where(user_id: [current_user])
	
	end

	def show
 		@vehicle =Vehicle.find(params[:id])
 		@current_user = User.find(current_user.id)
  end

  def new
  	@vehicle = Vehicle.new
  	@current_user = User.find(current_user.id)
  end

  def create

  	@vehicle = Vehicle.new(vehicle_params)
  	@vehicle.user_id = current_user.id
 	  @vehicle.save
  	redirect_to @vehicle
  end	

  def destroy
  	@vehicle = Vehicle.find(params[:id])
  	

    respond_to do |format|
      if @vehicle.destroy
        flash[:success] = t("vehicle.deleted", :name => @vehicle.name) 
        #Menu.where(parent_id: @menu.id).destroy_all
        redirect_to @vehicle
      else
        flash[:error] = t("vehicle.not_deleted", :name => @vehicle.name)
        
      end
    end

  end

  def edit
  	@vehicle = Vehicle.find(params[:id])
  	@current_user = User.find(current_user.id)
  end
  def update
	  @vehicle = Vehicle.find(params[:id])
	  @current_user = User.find(current_user.id)
	 
	  if @vehicle.update(vehicle_params)
	    redirect_to @vehicle
	  else
	    render 'edit'
	  end
	end

  def vehicle_params
  	params.require(:vehicle).permit(:name, :year, :brand, :model, :vin, :registration_number, :type_of_vehicle_id)
  end

end

class VehiclesController < ApplicationController


	def index
		@vehicles = Vehicle.where(user_id: [current_user])
	end

	def show

 		@vehicle = Vehicle.find(params[:id])
 		@current_user = User.find(current_user.id)
    @type_of_vehicle = TypesOfVehicle.where(:id => @vehicle.type_of_vehicle_id).first
    #raise "scycki"
    @documents = Document.where(:vehicle_id => params[:id])
    @events = Event.where(:vehicle_id => params[:id])
    # @type_of_event = TypesOfEvent.where(:id => @events.type_of_event_id).first
    # raise  @events
  end


  def new
    @vehicle = Vehicle.new
    @current_user = User.find(current_user.id)
  end


  def create

  	@vehicle = Vehicle.new(vehicle_params)
  	@vehicle.user_id = current_user.id
 	  if @vehicle.save
      flash[:notice] =t("vehicle.created")
    	redirect_to @vehicle
    else
      flash[:notice] =t("vehicle.not_created")
    end
  end	


  def destroy
  	@vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.destroy
        flash[:success] = t("vehicle.deleted", :name => @vehicle.name) 
        #Menu.where(parent_id: @menu.id).destroy_all
       
      else
        flash[:error] = t("vehicle.not_deleted", :name => @vehicle.name)
        
      end
      format.html { redirect_to vehicles_path }
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
  	params.require(:vehicle).permit(:name, :year, :brand, :model, :vin, :registration_number, :type_of_vehicle_id, :fleet_id)
  end

end

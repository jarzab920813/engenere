class VehiclesController < ApplicationController

  before_filter :authenticate_user!

	def index
		@vehicles = Vehicle.where(user_id: [current_user])
    respond_to do |format|
      format.html
      format.json { render json: VehiclesDatatable.new(view_context) }
    end
	end

	def show

    @vehicle = Vehicle.find(params[:id])
 		vehicle = Vehicle.find(params[:id])
 		@current_user = User.find(current_user.id)
    @type_of_vehicle = TypesOfVehicle.where(:id => vehicle.type_of_vehicle_id).first
    @documents = Document.where(:vehicle_id => params[:id])
    @events = Event.where(:vehicle_id => params[:id])

    respond_to do |format|
      format.html
      format.json { render json: EventsDatatable.new(view_context) }
    end
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
      flash[:error] =t("vehicle.not_created")
      redirect_to new_vehicle_path
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
  	params.require(:vehicle).permit(:name, :year, :brand, :model, :vin, :registration_number, :type_of_vehicle_id, :fleet_id, :mileage, :average_mileage)
  end

end

class FleetsController < ApplicationController
	
  before_filter :authenticate_user!

	def index
 		@fleets = Fleet.where(user_id: [current_user])
    # veh = current_user.vehicles
    # veh.each do |v|
    #   flag = false
    #   @fleets.each do |f|
    #     if v.fleet_id
    #       flag = true
    #     end
    #   end
    #   if flag == false
    #     v.fleet_id = nil
    #     v.save
    #   end
    # end
    @vehicles_without_fleets = current_user.vehicles.where(:fleet_id => nil)
 	end

 	def show
 		@fleet =Fleet.find(params[:id])
 		@current_user = User.find(current_user.id)
    @vehicles = Vehicle.where(:fleet_id => params[:id])
  end

  def new
  	@fleet = Fleet.new
  	@current_user = User.find(current_user.id)
  end

  def create

  	@fleet = Fleet.new(fleet_params)
  	@fleet.user_id = current_user.id
 	  @fleet.save
  	redirect_to fleets_path
    if @fleet.save
      flash[:success] = t("fleet.save")  
    else
      flash[:error] = t("fleet.not_deleted", :name => @fleet.name)
    end
  	
  end	

  def destroy
  	@fleet = Fleet.find(params[:id])
    # @fleet.id
    # pojazdy = Vehicles.find(:fleet_id => @fleet.id)
    # raise pojazdy.inspect

    respond_to do |format|
      if @fleet.destroy
        flash[:success] = t("fleet.deleted", :name => @fleet.name) 
        #Menu.where(parent_id: @menu.id).destroy_all
        #redirect_to @fleet
      else
        flash[:error] = t("fleet.not_deleted", :name => @fleet.name)
        
      end
      format.html { redirect_to fleets_path }
    end

  end

  def edit
  	@fleet = Fleet.find(params[:id])
  	@current_user = User.find(current_user.id)
  end

  def update
	  @fleet = Fleet.find(params[:id])
	  @current_user = User.find(current_user.id)
	 
	  if @fleet.update(fleet_params)
	    redirect_to fleets_path
      flash[:success] = t("fleet.update", :name => @fleet.name)  
	  else
	    render 'edit'
	  end
	end

  def find_vehicles(fleet)
    vehicles = Vehicle.where(:fleet_id => fleet.id)
    vehicles
  end

  def save_fleets
    params[:value_menu].each do |fleet|
      tmp = fleet.split(" ")
      vehicle = Vehicle.find(tmp[1])
      if tmp[0] == "000"
        vehicle.fleet_id = nil
        vehicle.save
      else
        vehicle.fleet_id = tmp[0]
        vehicle.save
      end
    end
  end

  def fleet_params
  	params.require(:fleet).permit(:name)
  end


end

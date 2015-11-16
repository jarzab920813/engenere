class FleetsController < ApplicationController
	

	def index
 		@fleets =Fleet.where(user_id: [current_user])
		
 	end

 	def show
 		@fleet =Fleet.find(params[:id])
 		@current_user = User.find(current_user.id)
  end

  def new
  	@fleet = Fleet.new
  	@current_user = User.find(current_user.id)
  end

  def create

  	@fleet = Fleet.new(fleet_params)
  	@fleet.user_id = current_user.id
 	  @fleet.save
  	redirect_to @fleet
  end	

  def destroy
  	@fleet = Fleet.find(params[:id])
  	

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
	    redirect_to @fleet
	  else
	    render 'edit'
	  end
	end

  def fleet_params
  	params.require(:fleet).permit(:name)
  end


end

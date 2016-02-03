class EventsController < ApplicationController

  before_filter :authenticate_user!
  
  def new
    if params[:id].present?
      @event = Event.new
      @event.vehicle_id = params[:id]
    end

    if params[:vehicle_id].present?
      @event = Event.new
      @event.vehicle_id = params[:vehicle_id]
    end
  end
  
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      flash[:notice] = "Zdarzenie zostało dodane."
      redirect_to vehicle_path(:id => @event.vehicle_id)
    else
      flash[:error] = "Zdarzenie nie zostało dodane."
      redirect_to new_event_path(:id => @event.vehicle_id)
    end
  end 

  def destroy
    @event = Event.find(params[:id])
    with_vehicle = @event.vehicle_id
    @vehicle = Vehicle.find(with_vehicle)
    respond_to do |format|
      if @event.destroy
        flash[:success] = t("event.deleted", :name => @event.name)    
      else
        flash[:error] = t("event.not_deleted", :name => @event.name)       
      end
      format.html { redirect_to vehicle_path(@vehicle) }
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    with_vehicle = @event.vehicle_id
    @vehicle = Vehicle.find(with_vehicle)
    
    if @event.update(event_params)
      redirect_to @vehicle
    else
      render 'edit'
    end
  end

  def new_similar
    old_event = Event.find(params[:id])
    @event = old_event.dup
    old_event.completed = true
    old_event.save
    render :new
  end

  def event_params
  	params.require(:event).permit(:name, :date_event_start, :date_next_event, :current_mileage, :mileage_to_next_event, :vehicle_id, :type_of_event_id, :cost, :completed)
  end
end

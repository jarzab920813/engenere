class EventsController < ApplicationController
  def new
  	if params[:id].present?
      @event = Event.new
      @event.vehicle_id = params[:id]
      raise @event

    end
    if params[:vehicle_id].present?
      @event = Event.new
      @event.vehicle_id = params[:vehicle_id]
      #raise @event
    end

  end

  def event_params
  	params.require(:event).permit(:name, :date_event_start, :date_next_event, :current_mileage, :mileage_to_next_event, :vehicle_id, :type_of_event_id)
  end
end

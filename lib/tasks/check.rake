namespace :check do
  task :send_mail => :environment do
  	evs = Event.where("date_next_event = ?", Time.now.to_date + 7.days)

  	evs_mil = Event.where("completed != ?", true)

  	evs_mil.each do |e|
	  	if e.mileage_to_next_event != nil && e.sended != true
	  		veh = Vehicle.where(:id => e.vehicle_id)
	  		if (e.mileage_to_next_event - veh.mileage) > 1000 
	  			if e.pass_mail
	  				e.sended = true
	  				e.save
	  			end
	  		end
	  	end
	  end

  	evs.each do |e|
  		if (e.completed != true && e.sended != true)
	  		if e.pass_mail
	  			e.sended = true
	  			e.save
	  		end
	  	end
  	end
  end
end
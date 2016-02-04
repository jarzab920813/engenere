namespace :check do
  task :send => :environment do
  	evs = Event.where("date_next_event = ?", Time.now.to_date + 6.days)

  	evs_mil = Event.where("completed != ?", 1)

  	# evs_mil.each do |e|
	  # 	if e.mileage_to_next_event != nil && e.sended != 1
	  # 		veh = Vehicle.where(:id => e.vehicle_id)
	  # 		if (e.mileage_to_next_event - veh.mileage) > 1000 
	  # 			if e.pass_mail_mileage
	  # 				e.sended = true
	  # 				e.save
	  # 			end
	  # 		end
	  # 	end
	  # end

  	evs.each do |e|
  		if e.completed != 1 && e.sended != 1
	  		if e.pass_mail
	  			e.sended = true
	  			e.save
	  		end
	  	end
  	end
  	# UserMailer.after_create.deliver
  end
end
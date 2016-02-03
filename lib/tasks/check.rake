namespace :check do
  task :send => :environment do
  	evs = Event.where("date_next_event = ?", Time.now.to_date + 7.days, :completed => 0)
  	evs.each do |e|
  		e.pass_mail
  	end
  	# UserMailer.after_create.deliver
  end
end
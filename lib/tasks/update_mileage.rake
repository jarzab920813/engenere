namespace :update do
  task :mileage => :environment do
  	vs = Vehicle.all
  	vs.each do |v|
  		v.update_mileage
  	end
  end
  
end
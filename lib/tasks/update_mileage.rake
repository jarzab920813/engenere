namespace :update do
  task :mileage => :environment do
  	vs = Vehicle.where.not(:mileage => nil, :average_mileage => nil)
  	vs.each do |v|
  		v.update_mileage
  	end
  end
  
end
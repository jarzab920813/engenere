namespace :check do
  task :send => :environment do
  	UserMailer.after_create.deliver
  end
end
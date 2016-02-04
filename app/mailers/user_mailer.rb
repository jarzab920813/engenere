class UserMailer < ApplicationMailer


	def after_create(user)
		@user = user
		mail to: @user.email, subject: "#{@user.email} Witamy w naszym serwisie" do |format| 
			format.html { render :file => "#{Rails.root}/app/views/user_mailer/after_create.html.slim" }
		end 

	end


	def pass_reminder(user, event)
		@user = user
		@event = event
		mail to: @user.email, subject: "#{@user.email} Przypominamy o wydarzeniu" do |format| 
			format.html { render :file => "#{Rails.root}/app/views/user_mailer/pass_reminder.html.slim" }
		end 
	end

end

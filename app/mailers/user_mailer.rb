class UserMailer < ApplicationMailer


	def after_create(user)
		@user = user
		mail to: @user.email, subject: "#{@user.email} Witamy w naszym serwisie"

	end


	def pass_reminder(user, event)
		@user = user
		@event = event
		mail to: @user.email, subject: "#{@user.email} Przypominamy o wydarzeniu"
	end
end

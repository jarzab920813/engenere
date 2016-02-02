class UserMailer < ApplicationMailer


	def after_create(user)
		@user = user
		mail to: @user.email, subject: "#{@user.email} Witamy w naszym serwisie"

	end


	def pass_reminder(user)
		# layout 'mail_layouts/pass_reminder.html.slim'
		path = "#{Rails.root}/app/views/layouts/mail_layouts/pass_reminder.html"
		@user = user
		mail to: @user.email, subject: "#{@user.email} Przypominamy o wydarzeniu",:template_path => path, :template_name => 'pass_reminder.html'
	end
end

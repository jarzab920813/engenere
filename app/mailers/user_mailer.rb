class UserMailer < ApplicationMailer
	layout 'mail_layouts/after_create.html'


	def after_create
		# @user = user
		mail to: "ka.mateusz@gmail.com", subject: "Witamy w naszym serwisie"

	end
end

class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'user_mailer/after_create.html'
end

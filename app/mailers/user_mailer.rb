class UserMailer < ApplicationMailer
  default from: "notifications@example.com"
  
  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Welcome to Blocmarks')
  end
  
end

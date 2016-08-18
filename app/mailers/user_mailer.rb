class UserMailer < ApplicationMailer
  default from: "notifications@example.com"
 
  def deleted_email(user)
    @user = user
    mail(to: @user.email, subject: "Your account has been deleted")
  end
end

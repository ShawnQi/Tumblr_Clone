class UserMailer < ActionMailer::Base
  default :from => 'admin@example.com'
  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end
end

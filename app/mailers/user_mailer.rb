class UserMailer < ApplicationMailer
  default from: "byorels@example.com"

  def confirmation_email(user)
    @user = user
    mail(:to => user.email, :subject => "Please Activate Your Account")
  end
end

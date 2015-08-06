class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email, 
        :to => 'sonja.greussing@hotmail.com', 
        :subject => "A new contact form message from #{name}")
  end
end
# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("rkwoods@gmail.com", "Russ", "Hello World!")
  end
	
	def welcome
    UserMailer.welcome(User.first)
  end
end
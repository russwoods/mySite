class UserMailer < ApplicationMailer
  default from: "rkwoods@gmail.com"

  def contact_form(user_email, name, message)
  @message = message
    mail(from: user_email,
         to: app_email,
         subject: "A new contact form message from #{name}")
  end
    
    def thank_you
        @name = params[:name]
        @email = params[:email]
        @message = params[:message]
        UserMailer.contact_form(@email, @name, @message).deliver_now
    end
    
    def order_placed(user, product)
        @user = user
        @product = product
        mail(to: user.email,
          from: app_email,
          subject: "Thank you!")
    end
    
    def app_email
        "rkwoods@gmail.com"
    end
    
end
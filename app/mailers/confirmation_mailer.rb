class ConfirmationMailer < ApplicationMailer
	default from: "my_store@mystore.com"
	def confirmation_email(user)
    	@user = user
    	mail(to: @user.email, subject: 'Confirmation Email')
  end

end

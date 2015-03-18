class UserMailer < ApplicationMailer

	def novo_usuario
		mail(:to => 'aristeuroriz@gmail.com', :subject => 'Teste de email!')
	end

	 def registration_confirmation(user)
    @user = user
    attachments["logo_400x91.png"] = File.read("#{Rails.root}/public/images/logo_400x91.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

   def welcome_email(user)
    @user = user
    @url  = 'http://musclesys.com.br/users/sign_in'
    mail(to:'aristeuroriz@gmail.com', subject: 'Bem vindo ao MuscleSys')
  end

end

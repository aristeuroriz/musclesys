class ContactMailer < ActionMailer::Base

 default :from => "contato@musclesys.com.br"
  default :to => "aristeuroriz@gmail.com"

   add_template_helper(ApplicationHelper)

  def new_contact(user,contact) # Teste de validação precisa ser corrigido

    @contact = contact
    @user = user

      mail(:subject => "[MuscleSys] #{contact.subject}")
  end
    


end
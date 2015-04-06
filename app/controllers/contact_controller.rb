class ContactController < ApplicationController

  def new
    @contact = Contact.new

  end

  def create
    @contact = Contact.new(params[:contact])
    # @user = Contact.new(params[:user])

      if @contact.valid?
        ContactMailer.new_contact(current_user, @contact).deliver_now

        redirect_to(root_path, :notice => "Mensagem enviada com sucesso. Obrigado pelo contato! ;-)")
          
       else
          flash.now.alert = "Por favor, preencha os campos obrigatórios."
           # render :new
      end
    end
end
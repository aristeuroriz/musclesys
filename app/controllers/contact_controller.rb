class ContactController < ApplicationController

  def verify_google_recptcha(secret_key,response)
    status = `curl "https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{response}"`
    logger.info "---------------status ==> #{status}"
    hash = JSON.parse(status)
    hash["success"] == true ? true : false
  end

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

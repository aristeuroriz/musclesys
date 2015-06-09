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
    status = verify_google_recptcha(SECRET_KEY,params["g-recaptcha-response"])

    if @contact.valid? && status
      ContactMailer.new_contact(current_user, @contact).deliver_now

      redirect_to(root_path, :notice => "Mensagem enviada com sucesso. Obrigado pelo contato! ;-)")

    else
      # format.json { render json: @contact.errors, status: :unprocessable_entity }
      flash.now.alert = "Por favor, preencha os campos obrigatórios."

    end
  end
end

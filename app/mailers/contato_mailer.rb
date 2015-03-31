#encoding: utf-8
class ContatoMailer < ActionMailer::Base
  default :from => "contato@musclesys.com.br"
 
  def contato_confirmation(contato)
    @contato = contato
    mail(:to => contato.email, :subject => "Contato - Ref. ##{@contato.id}# ")
  end
 
  def resposta_contato(contato_mensagem)
    @mensagem = contato_mensagem
  	@contato = contato_mensagem.contato
    mail(:to => @contato.email, :subject => "Resposta ref. ao contato ##{@contato.id}# - #{@contato.assunto}")  	
  end
 
  def receber(message, encoding)
    message = Mail.new(message)
 
    parse = /#[\d]+#/.match(message.subject)
 
    if parse
      contato = parse[0].delete('#')
      contato = Contato.find_by_id(contato)
      from = message.from
 
      if contato && from.include?(contato.email)
        plain_part = message.multipart? ? (message.text_part ? message.text_part.body.to_s : "") : message.body.to_s
        html_part = message.html_part ? message.html_part.body.to_s : ""
 
        plain_part = plain_part + html_part
 
        encoding = encoding && encoding[1].gsub(/[^\w+\d+-]/, "") 
        plain_part = plain_part.force_encoding(encoding) if encoding && Encoding.name_list.include?(encoding)
     
        contato.resolvido = false
        contato.updated_at = 3.hours.from_now
        contato.save!
 
        contato.contatos_mensagens.create :mensagem => plain_part,
                                          :created_at => message.date
      end
    end
  end
end
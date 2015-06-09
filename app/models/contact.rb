class Contact

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :msg


    # Teste de validação precisa ser corrigido
    if user_signed_in?
     validates :subject, :msg, :presence => true
   else
    validates :name, :email, :subject, :msg, :presence => true
   end


 def initialize(attributes = {})
  attributes.each do |name, value|
    send("#{name}=", value)
  end
end

def persisted?
  false
end

end
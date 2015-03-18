class User < ActiveRecord::Base

	has_many :medidas, dependent: :destroy
  has_many :treinos, dependent: :destroy

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable :confirmable,
  devise  :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :timeoutable, :omniauthable, :omniauth_providers => [:facebook], :timeout_in => 15.minutes

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0,20]
    user.full_name = auth.info.name   # assuming the user model has a name
    
  end
end

belongs_to :academia
belongs_to :plano

validates_acceptance_of :termos

# validates_presence_of :full_name, :birth_date, :sex , :stature, :objective, :location, :aceite

end

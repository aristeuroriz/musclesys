class User < ActiveRecord::Base

	has_many :medidas, dependent: :destroy

  has_many :treinos, dependent: :destroy
  
  belongs_to :plano

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  attr_reader :avatar_remote_url


  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable  :confirmable, 
  devise  :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable,
  :validatable, :timeoutable, :omniauthable, :omniauth_providers => [:facebook], :timeout_in => 15.minutes


  def self.find_for_facebook_oauth(auth)
      if user = User.find_by_email(auth.info.email)  # search your db for a user with email coming from fb
        return user  #returns the user so you can sign him/her in
      else

        case auth.extra.raw_info.gender
        when 'male'
          var_gender = 'Masculino'
        when 'female'
         var_gender = 'Feminino'
       else 
        var_gender = nil
      end

      if auth.extra.raw_info.birthday == nil
        var_birthday = nil
      else
        var_birthday = Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y')
      end

      user = User.create(
          provider: auth.provider,    # Create a new user if a user with same email not present
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20],
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          birth_date: var_birthday,
          gender: var_gender,
          location: auth.info.location,
          image_url: auth.info.image
          )

      return user
    end

  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.first_name = data["first_name"] if user.first_name.blank?
        user.last_name = data["last_name"] if user.last_name.blank?
         # user.password = Devise.friendly_token[0,20]
         # user.birth_date = data["birthday"]
         user.gender = data["gender"] if user.gender.blank?
         user.location = data["location"] if user.location.blank?
       end
     end
   end

   def full_name
    "99#{self.id} - #{self.first_name} #{self.last_name}"
  end


  validates_acceptance_of :termos

  validates_presence_of :first_name, :last_name, :birth_date, :gender , :stature,
  :objective, :location,  :unless => 'objective.nil?'

end


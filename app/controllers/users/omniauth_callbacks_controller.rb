class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.last_sign_in_at.blank? or @user.objective.blank? or @user.stature.blank? or @user.location.blank?
      check = true
    else
      check = false
    end

    if @user.persisted?

      sign_in(@user)

      if check == true
        redirect_to edit_user_registration_path, notice: 'Agora é necessário e muito importante completar seu cadastro'
      else
        redirect_to root_path
        set_flash_message(:notice, :success, :kind => "facebook") if is_navigational_format?
      end

    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end

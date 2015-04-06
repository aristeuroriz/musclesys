class RegistrationsController < Devise::RegistrationsController

	before_filter :authenticate_user!

	protected

	def update_resource(resource, params)

		# resource.update_without_password(params.except(:current_password))	

		if current_user.provider.present? and current_user.reset_password_token.blank?
			params.delete("current_password")
			resource.update_without_password(params)
		else
			resource.update_with_password(params)
		end
	end

end

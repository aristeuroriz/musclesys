class Medida < ActiveRecord::Base
	
	belongs_to :user

	def self.personal

		@medida = Medida.all

		if not @medida.blank?

			query = "UPDATE medidas m, users u SET m.personal_id = u.personal_id WHERE m.user_id = u.id"
			
			results = ActiveRecord::Base.connection.execute(query)
		end
	end

end

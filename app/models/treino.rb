class Treino < ActiveRecord::Base

	
	belongs_to :user

	validates_presence_of  :grupo_muscular, :desc_exercicio, :carga, :serie, :repeticoes

	def self.personal

	query = "UPDATE treinos t, users u SET t.personal_id = u.personal_id WHERE t.user_id = u.id"
	
	results = ActiveRecord::Base.connection.execute(query)

	end
         

end

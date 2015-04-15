class CreateTreinos < ActiveRecord::Migration
	def change
		create_table :treinos do |t|
			t.string :grupo_muscular
			t.string :desc_exercicio
			t.string :carga
			t.integer :serie
			t.string :repeticoes
			t.integer :personal_id
			t.references :user, index: true

			t.timestamps
		end
	end

end

class CreateMedidas < ActiveRecord::Migration
  def change
    create_table :medidas do |t|
      t.date :data_medida
      t.float :peso
      t.float :torax
      t.float :ombro
      t.float :braco_d
      t.float :braco_e
      t.float :ante_braco_d
      t.float :ante_braco_e
      t.float :cintura
      t.float :quadril
      t.float :coxa_d
      t.float :coxa_e
      t.float :perna_d
      t.float :perna_e
      t.text :obs
      t.references :user, index: true

      t.timestamps
    end
  end
end

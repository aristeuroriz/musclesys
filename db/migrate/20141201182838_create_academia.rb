class CreateAcademia < ActiveRecord::Migration
  def change
    create_table :academia do |t|
      t.string :nome_acad
      t.string :localidade
      t.string :instrutor

      t.timestamps
    end
  end
end

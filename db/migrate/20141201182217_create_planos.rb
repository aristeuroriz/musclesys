class CreatePlanos < ActiveRecord::Migration
  def change
    create_table :planos do |t|
      t.string :desc_plano
      t.float :valor_plano
      t.references :promo, index: true

      t.timestamps
    end
  end
end

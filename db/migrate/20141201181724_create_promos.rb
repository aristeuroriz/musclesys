class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :desc_promo
      t.date :validade
      t.float :porcentagem

      t.timestamps
    end
  end
end

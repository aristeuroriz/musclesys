class AddAceiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aceite, :boolean
  end
end

class RemoveAceiteToUsers < ActiveRecord::Migration
 def up
	remove_column :users, :aceite
end

  def down
    add_column :users, :aceite, :boolean
  end
end

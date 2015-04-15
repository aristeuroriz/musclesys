class AddFieldsToUsers < ActiveRecord::Migration
  def up

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :stature, :float
    add_column :users, :objective, :string
    add_column :users, :location, :string

    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
 
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :admin, :boolean
    add_column :users, :role, :string
    add_column :users, :personal_id, :integer

end

 def down

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :stature, :float
    add_column :users, :objective, :string
    add_column :users, :location, :string

    add_column :users, :latitude, :string
    add_column :users, :longitude, :string

    add_column :users, :planos_id, :integer
    add_column :users, :academias_id, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    
end
end

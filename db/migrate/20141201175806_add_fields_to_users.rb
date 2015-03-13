class AddFieldsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :full_name, :string
    add_column :users, :sex, :string
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
    add_column :users, :aceite, :boolean

end
end

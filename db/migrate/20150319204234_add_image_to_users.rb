class AddImageToUsers < ActiveRecord::Migration

  def change
  	add_column :users, :image_url, 			:string
  	#add_column :users, :oauth_token, 		:string
  	#add_column :users, :oauth_expires_at, 	:datetime
  end
end

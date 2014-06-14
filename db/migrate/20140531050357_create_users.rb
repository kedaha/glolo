class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :screen_name, uniqueness: true
      t.timestamps
    end

    create_table :external_accounts do |t|
      t.integer :user_id, null: false
      t.index :user_id
      t.string :type
      t.string :provider
      t.text :oauth_token
      t.text :refresh_token
      t.integer :expires_at
      t.string :uid
      t.index :uid
      t.string :username
      t.string :picture_url
      t.timestamps
    end
  end
end

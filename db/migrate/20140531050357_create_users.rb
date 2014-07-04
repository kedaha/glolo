class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :screen_name, uniqueness: true
      t.integer :contact_profile_id
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

    create_table :user_contact_profiles do |t|
      t.string :phone
      t.string :email
      t.boolean :frozen, default: false
      t.timestamps
    end

    create_table :locations do |t|
      t.string :cross_street1
      t.string :cross_street2
      t.string :city
      t.string :state

      t.decimal :latitude
      t.decimal :longitude

      t.string :specific_directions

      t.timestamps
    end

    create_table :users_locations do |t|
      t.integer :user_id
      t.index :user_id

      t.integer :location_id

      t.timestamps
    end
  end
end

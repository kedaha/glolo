class CreatePostsAndItems < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.index :user_id

      t.integer :category_id
      t.index :category_id

      t.integer :contact_profile_id

      t.string :title

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :categories_posts do |t|
      t.integer :post_id

      t.integer :category_id
      t.index :category_id

      t.integer :strength

      t.timestamps
    end
    add_index :categories_posts, [:post_id, :category_id], unique: true

    create_table :categories_keywords do |t|
      t.integer :keyword_id
      t.index :keyword_id

      t.integer :category_id
      t.index :category_id

      t.integer :strength, default: 0, null: false

      t.timestamps
    end

    create_table :keywords do |t|
      t.string :name

      t.timestamps
    end

    create_table :pickup_locations_posts do |t|
      t.integer :post_id
      t.index :post_id

      t.integer :location_id
      t.index :location_id

      t.timestamps
    end

    create_table :delivery_locations_posts do |t|
      t.integer :post_id
      t.index :post_id

      t.integer :location_id
      t.index :location_id

      t.integer :radius

      t.timestamps
    end

    create_table :items do |t|
      t.integer :post_id
      t.index :post_id

      t.integer :user_id
      t.index :user_id

      t.string :title
      t.text :description
      t.integer :length
      t.integer :width
      t.integer :height
      t.string :link
      t.boolean :pet_free
      t.string :why_selling
      t.string :any_defects

      t.integer :condition_id
      t.index :condition_id

      t.timestamps
    end

    create_table :option_types do |t|
      t.string :name

      t.timestamps
    end

    create_table :option_values do |t|
      t.integer :option_type_id
      t.index :option_type_id

      t.string :value

      t.timestamps
    end

    create_table :items_option_values do |t|
      t.integer :option_value_id
      t.index :option_value_id

      t.integer :item_id
      t.index :item_id

      t.timestamps
    end

    create_table :item_categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :item_categories_items do |t|
      t.integer :item_id
      t.index :item_id

      t.integer :category_id
      t.index :category_id

      t.timestamps
    end

    create_table :item_groups do |t|
      t.string :name

      t.integer :user_id

      t.timestamps
    end

    create_table :item_groups_items do |t|
      t.integer :item_id
      t.index :item_id

      t.integer :item_group_id
      t.index :item_group_id

      t.timestamps
    end

    create_table :item_conditions do |t|
      t.string :name

      t.timestamps
    end

    create_table :item_images do |t|
      t.attachment :img
    end
  end
end

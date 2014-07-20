class Item < ActiveRecord::Base
  belongs_to :post
  has_and_belongs_to_many :item_categories
end

class Item < ActiveRecord::Base
  belongs_to :post
  belongs_to :holder, polymorphic: true
  has_and_belongs_to_many :categories, class_name: "ItemCategory"
end

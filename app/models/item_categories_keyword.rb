class ItemCategoriesKeyword < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :item_category

  validates :strength, presence: true
end

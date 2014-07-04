class CategoriesKeyword < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :category

  validates :strength, presence: true
end

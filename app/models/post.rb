class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post_category
  has_one :item

  validates :user, :title, presence: true
end

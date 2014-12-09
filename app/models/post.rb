class Post < ActiveRecord::Base
  belongs_to :user
  has_one :item
  has_many :categories_posts
  has_many :categories, through: :categories_posts

  validates :user, presence: true
end

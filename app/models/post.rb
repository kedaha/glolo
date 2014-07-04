class Post < ActiveRecord::Base
  belongs_to :user
  has_one :item

  validates :user, :title, presence: true
end

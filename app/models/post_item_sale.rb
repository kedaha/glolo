class PostItemSale < ActiveRecord::Base
  has_one :post, as: :postable
  has_many :items
end

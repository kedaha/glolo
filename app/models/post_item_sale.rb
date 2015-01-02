class PostItemSale < ActiveRecord::Base
  has_one :post, as: :postable
  has_one :item, as: :holder
end

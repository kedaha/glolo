class PostJob < ActiveRecord::Base
  has_one :post, as: :postable
end

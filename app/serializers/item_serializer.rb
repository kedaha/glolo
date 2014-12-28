class ItemSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :user_id, :title, :description, :length, :width, :height, :link, :pet_free, :why_selling, :any_defects, :condition_id, :holder_id, :holder_type

  has_many :categories
  has_one :condition
end

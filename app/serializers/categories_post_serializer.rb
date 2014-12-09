class CategoriesPostSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :category_id

  has_one :category
end

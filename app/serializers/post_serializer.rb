class PostSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :contact_profile_id, :title, :user_id

  has_many :categories
end

class PostSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :title, :completed_at, :contact_profile_id, :postable_type, :postable_id
  has_one :postable
end

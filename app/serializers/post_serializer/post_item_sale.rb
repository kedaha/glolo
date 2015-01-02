module PostSerializer
  class PostItemSale < ActiveModel::Serializer
    attributes :id, :type, :title, :completed_at, :contact_profile_id, :item
    delegate :item, to: :postable

    def postable
      object.postable
    end
  end
end

class PostItemSaleSerializer < ActiveModel::Serializer
  attributes :id, :type

  def type
    object.class.to_s
  end
end

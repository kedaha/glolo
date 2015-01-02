module PostSerializer
  class Generic < ActiveModel::Serializer
    attributes :id, :type
  end
end

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :postable, polymorphic: true

  validates :user, :type, presence: true

  def type
    postable.class.to_s.underscore if postable
  end

  def type=(val)
    if postable.nil?
      self.postable = PostType.from_enum(val).create!
    end
  end

  def serializer(options = {})
    type = postable_type || "Generic"
    options[:scope] ||= self
    "PostSerializer::#{type}".constantize.new(self, options)
  end
end

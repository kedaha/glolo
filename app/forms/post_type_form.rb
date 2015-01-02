class PostTypeForm
  include ActiveModel::Validations

  ATTRIBUTES = [:type]
  attr_reader *ATTRIBUTES

  validate :valid_type?

  def initialize(params, current_user, current_post)
    @user = current_user
    @post = current_post

    ATTRIBUTES.each do |attr|
      instance_variable_set("@#{attr}", params[attr])
    end
  end

  # def persisted?
  #   false
  # end

  def save
    if valid?
      post.postable = type.camelize.constantize.create!
    else
      false
    end
  end

  private

  def valid_type?
    PostDetailModels.all_as_enum.include?(type)
  end
end

# pick post type to create post and post_detail + any extra associations per specific post_detail type

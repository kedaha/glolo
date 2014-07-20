class PostCategory < ActiveRecord::Base
  has_many :posts

  validates :name, uniqueness: true

  def presentation
    I18n.t("post_category.types.#{name}")
  end
end

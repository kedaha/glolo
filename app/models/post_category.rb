class PostCategory < ActiveRecord::Base
  ACCEPTABLE_NAMES = %w( item_sale job )
  has_many :posts

  validates :name, uniqueness: true, presence: true, inclusion: {in: ACCEPTABLE_NAMES}

  def self.item_sale
    self.where(name: "item_sale").first_or_create
  end

  def postable_class
    "post_#{name}".classify.constantize
  end

  def presentation
    I18n.t("post_category.types.#{name}", default: name)
  end
end

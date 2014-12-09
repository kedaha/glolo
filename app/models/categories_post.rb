class CategoriesPost < ActiveRecord::Base
  MAX_CATEGORIES_PER_POST = 6

  belongs_to :post
  belongs_to :category

  validates :post, :category, presence: true
  validate :within_max_allowed_categories_per_post

  private

  def within_max_allowed_categories_per_post
    if !(post.categories.length <= MAX_CATEGORIES_PER_POST)
      errors.add :base, 'Post already has as many categories as it is allowed'
    end
  end
end

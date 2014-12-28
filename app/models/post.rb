class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: 'PostCategory'
  belongs_to :postable, polymorphic: true

  validates :user, presence: true
  validate :category_unchanged
  before_save :build_postable

  def type
    category.try :name
  end

  private

  def category_unchanged
    if changes[:category_id] && changes[:category_id][0] != nil
      errors.add :category_id, "cannot be changed"
    end
  end

  def build_postable(*args)
    if category.present? && postable_id.nil?
      postable = category.postable_class.create!(*args)
      self.postable = postable
    end
  end
end

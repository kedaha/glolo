class Keyword < ActiveRecord::Base
  has_many :categories_keywords
  has_many :item_categories, through: :item_categories_keywords

  validates :name, uniqueness: true
  validate :name_has_no_spaces

  private

  def name_has_no_spaces
    if name_changed? && name.match(' ')
      errors.add :name, "cannot have spaces"
    end
  end
end

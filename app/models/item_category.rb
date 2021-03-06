class ItemCategory < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_many :item_categories_keywords
  has_many :keywords, through: :item_categories_keywords

  validates :name, uniqueness: true

  after_create :create_default_keywords

  def strengthen_or_add_keyword!(name)
    keyword = Keyword.find_by(name: name)

    if keyword
      link = item_categories_keywords.find_or_create_by(keyword_id: keyword.id)
      link.strength += 1
      link.save!
    else
      keywords.create!(name: name)
    end
  end

  def presentation
    I18n.t("item_category.types.#{name}", default: name)
  end

  private

  def create_default_keywords
    name.split(/\s+/).each {|n| strengthen_or_add_keyword!(n) }
  end
end

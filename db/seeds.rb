item_categories = {
  "furniture" => %w(furniture desks couches sofas chairs tables bookshelf shelf shelves armoire benches beds mattresses nightstand night stand),
  "appliances" => %w(appliances refrigerators freezers ovens washers dryers microwaves blenders juicers),
  "clothing and accessories" => %w(clothing and accessories skirts pants shirts t-shirts scarves hats),
  "antiques" => %w(antiques tables beds),
  "home goods" => %w(home goods),
  "bedroom" => %w(bedroom beds)

}

ActiveRecord::Base.transaction do
  ItemCategory.delete_all
  Keyword.delete_all
  ItemCategoriesKeyword.delete_all

  item_categories.each do |category_name, keyword_names|
    c = ItemCategory.create!(name: category_name)
    keyword_names.each do |keyword_name|
      c.strengthen_or_add_keyword!(keyword_name)
    end
    c.save!
  end
end

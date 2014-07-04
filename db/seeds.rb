# post categories and keywords
categories = {
  "furniture" => %w(furniture desks couches sofas chairs tables bookshelf shelf shelves armoire benches beds mattresses nightstand night stand),
  "appliances" => %w(appliances refrigerators freezers ovens washers dryers microwaves blenders juicers),
  "clothing and accessories" => %w(clothing and accessories skirts pants shirts t-shirts scarves hats),
  "antiques" => %w(antiques tables beds),
  "home goods" => %w(home goods),
  "bedroom" => %w(bedroom beds)

}

    Category.delete_all
    Keyword.delete_all
    CategoriesKeyword.delete_all

categories.each do |category_name, keyword_names|
  c = Category.create!(name: category_name)
  keyword_names.each do |keyword_name|
    c.strengthen_or_add_keyword!(keyword_name)
  end
  c.save!
end

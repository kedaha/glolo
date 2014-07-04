class KeywordService
  def self.find_categories(str)
    keywords = extract_keywords(str)
    return Category.all if keywords.empty?

    query = keywords.map { |k| 'keywords.name LIKE "' + k + '%"' }.join(" OR ")

    Category.joins(:keywords).where(query)
  end

  def self.all_keywords_with_categories
    # TODO: construct this every 30 minutes and cache
    hash = Hash.new([])

    Keyword.order(:name).includes(:categories).each do |keyword|
      hash[keyword.name] = keyword.categories.pluck(:id)
    end

    hash
  end

  private

  def self.extract_keywords(str)
    return [] if str.nil?

    keywords = str.split(/\s+/)
    keywords = keywords.map{|k| k.gsub(/\W/, "")}
    keywords = keywords.select{|k| k.length >= 2}

    raise ArgumentError, "argument too long" if keywords.length > 10

    keywords
  end
end

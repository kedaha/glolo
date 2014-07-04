class TrieDictionary
  def initialize
    @tree = {}
  end

  def add_all(word_hash)
    word_hash.each do |word, value|
      add(word, value)
    end
  end

  def add(word, val, subtree = @tree)
    if word.size == 0
      subtree[:terminal] = val
    else
      first_char = word[0]
      rest = word[1..-1]
      subtree[first_char] ||= {}
      add(rest, val, subtree[first_char])
    end
  end

  def include?(word)
    subtree = walk(word)
    subtree && subtree[:terminal]
  end

  def find(prefix)
    subtree = walk(prefix)
    return [] unless subtree
    return words(subtree, prefix)
  end

  def find_values(prefix)
    subtree = walk(prefix)
    return [] unless subtree
    return word_values(subtree, prefix)
  end

  def words(subtree = @tree, prefix = "", word_array = [] )
    subtree.each do |key, next_subtree|
      if key == :terminal
        word_array << prefix
      else
        words(next_subtree, prefix + key, word_array)
      end
    end
    return word_array
  end

  def word_values(subtree = @tree, prefix = "", word_array = [] )
    subtree.each do |key, next_subtree|
      if key == :terminal
        word_array << next_subtree
      else
        word_values(next_subtree, prefix + key, word_array)
      end
    end
    return word_array
  end

  private

  def walk(word)
    subtree = @tree
    word.each_byte do |byte|
      subtree = subtree[byte.chr]
      return false if subtree.nil?
    end
    return subtree
  end

end

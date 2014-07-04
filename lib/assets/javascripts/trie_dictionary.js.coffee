class @TrieDictionary
  constructor: (wordsHash) ->
    @tree = {}
    @addAll(wordsHash) if wordsHash

  add: (word, val, subtree) ->
    subtree ||= @tree
    if word.length == 0
      subtree["terminal"] = val
    else
      firstChar = word[0]
      rest = word.slice(1)
      subtree[firstChar] ||= {}
      @add(rest, val, subtree[firstChar])

  addAll: (wordHash) ->
    for word, value of wordHash
      @add(word, value)

  words: (subtree, prefix, wordArray) ->
    subtree ||= @tree
    prefix ||= ""
    wordArray ||= []

    for key, nextSubtree of subtree
      if key == "terminal"
        wordArray.push(prefix)
      else
        nextPrefix = prefix + key
        @words(nextSubtree, nextPrefix, wordArray)

    wordArray

  wordValues: (subtree, prefix, wordArray) ->
    subtree ||= @tree
    prefix ||= ""
    wordArray ||= []

    for key, nextSubtree of subtree
      if key == "terminal"
        wordArray.push(subtree[key])
      else
        nextPrefix = prefix + key
        @wordValues(nextSubtree, nextPrefix, wordArray)

    wordArray


  includes: (word) ->
    subtree = @_walk(word)
    !!(subtree && subtree.hasOwnProperty("terminal"))

  find: (prefix) ->
    subtree = @_walk(prefix)
    return [] unless subtree
    @words(subtree, prefix)

  findValues: (prefix) ->
    subtree = @_walk(prefix)
    return [] unless subtree
    @wordValues(subtree, prefix)

  _walk: (word) ->
    subtree = @tree
    for char in word
      subtree = subtree[char]
      return false unless subtree

    subtree

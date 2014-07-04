#= require spec_helper
#= require jquery
#= require trie_dictionary

describe "TrieDictionary", ->
  beforeEach ->
    @dict = new TrieDictionary

  describe "#add", ->
    it "adds word to words", ->
      @dict.add("word1")
      expect(@dict.words()).toEqual(["word1"])

    it "adds correct definition to word", ->
      @dict.add("word1", "definition1")
      expect(@dict.wordValues()).toEqual(["definition1"])


  describe "#addAll", ->
    it "adds multiple words", ->
      @dict.addAll({word1: "definition1", word2: "definition2"})
      expect(@dict.words()).toEqual ["word1", "word2"]

  describe "#includes", ->
    beforeEach -> @dict.add("word")

    it "returns true when searching for existing word", ->
      expect(@dict.includes("word")).toBe true
    it "returns false when searching for substring of word", ->
      expect(@dict.includes("wor")).toBe false
    it "returns false when searching for nonmatching word", ->
      expect(@dict.includes("abc")).toBe false

  describe "#find", ->
    beforeEach -> @dict.addAll({word1: 'd1', word2: 'd2', other: 'd3'})

    it "returns all words matching substring", ->
      expect(@dict.find("word")).toEqual(["word1", "word2"])

  describe "#findValues", ->
    beforeEach -> @dict.addAll({word1: 'd1', word2: 'd2', other: 'd3'})

    it "returns definitions of all words matching substring", ->
      expect(@dict.findValues("word")).toEqual(["d1", "d2"])

  describe "#wordValues", ->
    beforeEach -> @dict.addAll({word1: 'd1', word2: 'd2'})

    it "returns all word values", ->
      expect(@dict.wordValues()).toEqual(["d1", "d2"])

  describe "#words", ->
    beforeEach -> @dict.addAll({word1: 'd1', word2: 'd2'})

    it "returns all words", ->
      expect(@dict.words()).toEqual(["word1", "word2"])








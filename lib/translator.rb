# require modules here
require 'pry'
require 'yaml'


def load_library(path)
  # code goes here
 emoticons = YAML.load_file(path)
 emoticons_hash = {}
 emoticons.each do |english_meaning, emoticon_array| #emoticon_array = ["O:)", "☜(⌒▽⌒)☞"]
   emoticons_hash[english_meaning] ||= {}
   emoticons_hash[english_meaning][:english] = emoticon_array[0]
   emoticons_hash[english_meaning][:japanese] = emoticon_array[1]
 end
 emoticons_hash
end


def get_japanese_emoticon(path, english_emoticon)
  # code goes here
  library = load_library(path)
  library.each do |english_meaning, inner_hash| # english_meaning = "happy" // inner_hash = {:english => ":)", :japanese => "(＾ｖ＾)"}
    return inner_hash[:japanese] if inner_hash[:english] == english_emoticon
  end
  "Sorry, that emoticon was not found"
end


def get_english_meaning(path, japanese_emoticon)
  # code goes here
  library = load_library(path)
  library.each do |english_meaning, inner_hash|
    return english_meaning if inner_hash[:japanese] == japanese_emoticon
  end
   "Sorry, that emoticon was not found"
end

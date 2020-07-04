# require modules here

def load_library(emoticon_file)
  require 'yaml'
  new_hash = {}
  emoticons = YAML.load_file('lib/emoticons.yml')
  emoticons.each do |key, element|
    new_hash[key] = {}
    new_hash[key][:english] = element.first
    new_hash[key][:japanese] = element.last
  end
  new_hash
end

def get_japanese_emoticon(emoticon_file, input)
  translation = load_library(emoticon_file)
  info = "Sorry, that emoticon was not found"
  translation.each do |key, element|
    if translation[key][:english] == input
    info = translation[key][:japanese]
  end
end 
info
end

def get_english_meaning(emoticon_file, input)
   translation = load_library(emoticon_file)
  info = "Sorry, that emoticon was not found"
  translation.each do |key, element|
    if translation[key][:japanese] == input
    info = key 
  end
end 
info
end
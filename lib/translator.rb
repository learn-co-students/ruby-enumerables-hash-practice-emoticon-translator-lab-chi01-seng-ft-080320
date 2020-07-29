require "yaml"
require 'pry'

def load_library(file)
  emotes = YAML.load_file(file)
  emoticons = {}
  emotes.each do |key, value| 
    emoticons[key] = {}
    emoticons[key][:japanese] = value[1]
    emoticons[key][:english] = value[0]
  end
  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
 emoticons = load_library(file_path)
 japanese_equiv = " "
  emoticon = emoticons.keys.find do |k|
    
    emoticons[k][:english] == emoticon
   #japanese_equiv = emoticons[k][:japanese]
  end
  #binding.pry
 if emoticon
  return emoticons[emoticon][:japanese]
else 
  "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
 match = emoticons.keys.find do |k|
  emoticons[k][:japanese] == emoticon
end
  if match != nil
    return match
    else "Sorry, that emoticon was not found"
  #binding.pry
   end
end
  #emoticons.keys.find do |k|
    #emoticons[k][:english] == emoticon
  
  
  
  
  
  
  return "Sorry, that emoticon was not found"
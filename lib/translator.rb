# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  hash = {}
  emoticons.each do |k, v|
    hash[k] = {
      :english => v[0],
      :japanese => v[1]
    }
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  emoji = ""
  emoticon_hash.keys.each do |key|
    if emoticon == emoticon_hash[key][:english]
      emoji = emoticon_hash[key][:japanese]
    end
  end
  emoji != "" ? emoji : "Sorry, that emoticon was not found" 
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  results = emoticon_hash.keys.find do |key|
    emoticon == emoticon_hash[key][:japanese]
  end
  results ? results : "Sorry, that emoticon was not found"
end
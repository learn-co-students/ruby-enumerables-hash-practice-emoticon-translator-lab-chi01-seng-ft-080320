# require modules here
require "yaml"
require "pry"

def load_library(file_path)
 #code goes here
  emo = YAML.load_file(file_path)
  final_hash = {}
  emo.each do |name,arrays|
      final_hash[name] ||= {}
      final_hash[name][:english] = arrays[0]
      final_hash[name][:japanese] = arrays[1]
  end
frank_emo
end

def get_japanese_emoticon(file_path, eng_emo)
  library = load_library(file_path)
  library.each do |meaning, idioms|
      return idioms[:japanese] if idioms[:english] == eng_emo
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emo)
  library = load_library(final_path)
  library.each do |meaning, idioms|
    return meaning if idioms[:japanese] == jap_emo
  end
    "Sorry, that emoticon was not found"
 end

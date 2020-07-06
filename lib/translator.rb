require 'pry' 
require 'yaml' # require modules here

def load_library(emoticon_library)
  emoticon_library = YAML.load_file('./lib/emoticons.yml')
  result = emoticon_library.each_with_object ({}) do |(key, value), final_hash|
    if !final_hash[key]
      final_hash[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    end 
  end 
end 

def get_japanese_emoticon(yaml_file, english_emo_file)
  new_hash = load_library(yaml_file) 
  new_hash.map do |name, languages|
    return languages[:japanese] if languages[:english] == english_emo_file 
  end
    "Sorry, that emoticon was not found"
end


def get_english_meaning(yaml_file, jap_emo_file)
  new_hash = load_library(yaml_file)
  new_hash.map do |name, languages|
    return name if languages[:japanese] == jap_emo_file 
  end 
  "Sorry, that emoticon was not found"
  # code goes here
end
require 'yaml'
require 'pry'

def load_library(file_path)
emoticons = YAML.load_file(file_path)
emoticon_lib = emoticons.each_with_object ({}) do |(key, value), new_hash|
 new_hash[key] = {:english => value[0], :japanese => value[1]}
  end
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_lib = load_library(file_path)
    emoticon_lib.each do |key, value| 
     if emoticon == value[:english]
       return value[:japanese]
      end
    end
  "Sorry, that emoticon was not found"
  end


def get_english_meaning(file_path, emoticon)
  emoticon_lib = load_library(file_path)
  emoticon_lib.each do |key, value| 
     if emoticon == value[:japanese]
       return key
      end
    end
    "Sorry, that emoticon was not found"
 end
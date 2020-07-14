require "yaml"
require "pry"

def load_library(file)
  emojis = YAML.load_file(file)
  
  result =emojis.each_with_object({}) do |(key, value), final_hash|
    if(!final_hash[key])
      final_hash[key] ={}
    end 
    if(!final_hash[key][:english])
      final_hash[key][:english] = value[0]
    end 
    
    if(!final_hash[key])
      final_hash[key] ={}
    end 
    if(!final_hash[key][:japanese])
      final_hash[key][:japanese] = value[1]
    end 
  end 
   pp result
end


def get_japanese_emoticon(file, western_emoji)
    emojis_hash = load_library(file)
    emoji_id = ''
    target ="Sorry, that emoticon was not found"
    emojis_hash.each do |key, value|
      value.each do |language, emoji|
        if(emoji == western_emoji)
          emoji_id = key
        end 
        if(emoji_id == key && language == :japanese)
          target = emoji
        end 
      end
    end 
  target
end

def get_english_meaning(file, japanese_emoji)
    emojis_hash = load_library(file)
    emoji_id = ''
    target ="Sorry, that emoticon was not found"
    
    emojis_hash.each do |key, value|
      value.each do |language, emoji|
        if(emoji == japanese_emoji)
          target = key
        end
      end
    end 
  pp target
end

get_english_meaning("./lib/emoticons.yml", "(￣ー￣)")

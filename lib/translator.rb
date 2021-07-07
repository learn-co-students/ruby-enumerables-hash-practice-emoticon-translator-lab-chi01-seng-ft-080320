# require modules here

require "pry"
require "yaml"

=begin
Write a method, load_library, that loads the emoticons.yml file. This method should return a hash where each key is the name of an emoticon. Each emoticon name should point to a nested hash containing two keys, :english and :japanese. These keys will point to English and Japanese versions of the emoticon.
=end 

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticons.each_with_object({}) do |(emoji_title, emoji_array), emoji_hash|
    emoji_array.each do |emoji|
      value_hash = {}
      value_hash[:english] = emoji_array[0]
      value_hash[:japanese] = emoji_array[1]
      emoji_hash[emoji_title] = value_hash
    end 
  end
end


=begin
Write a method, get_english_meaning, that takes a Japanese emoticon and returns its name in English. This method will rely on load_library to first load the YAML file.
=end 

def get_english_meaning(file, j_emoji)
  emoticon_hash = load_library(file)
  sorry_message = "Sorry, that emoticon was not found"
  emoticon_hash.each do |emoji_title, value_hash|
    value_hash.each do |language, emoji|
      if j_emoji == emoji
        return emoji_title
      end 
    end
  end
  return sorry_message
end

=begin
  if j_emoji
        puts e_emoji
      else nil
        puts "Sorry, that emoji was not found" 
      end
=end


=begin
Write a method, get_japanese_emoticon, that will take a traditional Western emoticon (i.g. :)) and translate it to its Japanese version ((＾ｖ＾)). It will also rely load_library to first load the YAML file.
=end

def get_japanese_emoticon(file,e_emoji)
  emoticon_hash = load_library(file)
  sorry_message = "Sorry, that emoticon was not found"
  emoticon_hash.each do |emoji_title, value_hash|
    value_hash.each do |language, emoji|
      if e_emoji == emoji
        return emoticon_hash[emoji_title][:japanese]
      end
    end
  end
  return sorry_message
end




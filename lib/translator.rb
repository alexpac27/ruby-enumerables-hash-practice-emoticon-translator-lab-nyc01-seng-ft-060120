require 'pry'
require "yaml"

#test_emoji =  {
#  "angel"=>["O:)", "☜(⌒▽⌒)☞"],
#  "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#  "wink"=>[";)", "(^_-)"]}

def load_library (file)
  emojifile = YAML.load_file(file)

  hash = {}
    emojifile.each do |key,value|
      hash[key] = {:english => value[0], :japanese => value[1]}
      end
  return hash
end

def get_english_meaning(file, j_emoticon)
  translation = ""
  new_hash = load_library(file)
  new_hash.each do |name, languages|
      if languages[:japanese] == j_emoticon
      translation = name
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else
      return translation
    end
  end

def get_japanese_emoticon(yaml_file, eng_emoti)
translation = ""
new_hash = load_library(yaml_file)
new_hash.each do |name, languages|
    if languages[:english] == eng_emoti
    translation = languages[:japanese]
  end
end
  if translation == ""
    return "Sorry, that emoticon was not found"
  else
    return translation
  end
end

#def get_japanese_emoticon (file, e_emoticon)
#  emojifile = load_library(file)
  #  if emojifile["get_emoticon"].include? (e_emoticon)
  #    return emojifile["get_emoticon"][e_emoticon]
  #  else
  #    return "Sorry, that emoticon was not found"
  #  end
#end

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
  pp hash
end

def get_english_meaning(file, j_emoticon)
  emojifile = load_library(file)

  emojifile.each {|key,value|
    if emojifile[key][:japanese].include?(j_emoticon)
    return emojifile.key(emojifile[key])
  end
}
end

def get_japanese_emoticon (file, e_emoticon)
  emojifile = load_library(file)
  emojifile.each {|key,value|
    if emojifile[key][:english].include?(e_emoticon)
    return emojifile[key][:japanese]
  end
}
#  else
#    return "Sorry, that emoticon was not found"


end

#def get_japanese_emoticon (file, e_emoticon)
#  emojifile = load_library(file)
  #  if emojifile["get_emoticon"].include? (e_emoticon)
  #    return emojifile["get_emoticon"][e_emoticon]
  #  else
  #    return "Sorry, that emoticon was not found"
  #  end
#end

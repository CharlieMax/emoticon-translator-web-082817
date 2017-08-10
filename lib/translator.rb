# require modules here
require 'yaml'

def load_library(path)
  lib = {}
  lib['get_meaning'] = {}
  lib['get_emoticon'] = {}
  loaded = YAML.load_file(path)
  loaded.keys.each do | key |
    lib['get_meaning'][loaded[key][1]] = key
    lib['get_emoticon'][loaded[key][0]] = loaded[key][1]
  end
  lib
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  jpn_emoji = lib['get_emoticon'][emoticon]
  if jpn_emoji
    jpn_emoji
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  eng_meaning = lib['get_meaning'][emoticon]
  if eng_meaning
    eng_meaning
  else
    "Sorry, that emoticon was not found"
  end
end

#load_library('./lib/emoticons.yml')

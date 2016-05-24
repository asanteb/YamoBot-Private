require 'rubygems'
require 'json'
load "tweet.rb"

$settings = { "key_a" => 2,
              "key_b" => 2}

class YamoBot

  def set_config(bool)
    $settings["local_keys"] = bool
  end

  def input_keys

    open('auth.temp', 'w') { |f|
      puts "Enter Consumer Key"
      f << gets
      puts "Enter Consumer Secret"
      f << gets
      puts "Enter Access Token"
      f << gets
      puts "Enter Access Secret"
      f << gets
    }

  end

  def finalize_settings
    File.open("settings.json","w") do |f|
      f.write($settings.to_json)
    end
  end

end

new_bot = YamoBot.new

new_bot.set_config(false)
new_bot.finalize_settings
new_tweet = PostTweet.new
new_tweet.post_tweet("yo")

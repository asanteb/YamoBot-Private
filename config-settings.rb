require 'rubygems'
require 'json'


json = File.read('settings.json')
$settings = JSON.parse(json)

class Config

  def local_keys
    @set_setting = $settings["local_keys"]
  end


end



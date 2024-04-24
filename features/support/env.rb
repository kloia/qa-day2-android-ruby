require 'em/pure_ruby'
require 'appium_lib'
require 'rspec'
require 'yaml'
require 'allure-cucumber'

#Dir.pwd rubynin calistigi dizinin pathini verir
# "#{Dir.pwd}/config/**/*.rb" bu ifade calisma dizinin altindaki config klasorunde ve onun alt
# klasorlerinde yer alan tum ruby dosyalarini eslestirir
#

Dir["#{Dir.pwd}/config/**/*.rb"].each { |file| require_relative file }
Dir["#{Dir.pwd}/utils/*.rb"].each { |file| require_relative file }

case BaseConfig.device_type
when 'local'
  $caps = YAML.load_file(File.expand_path("./config/device/device_config.yml"))
  device = `adb devices -l`.strip.split("attached")[1]
  $caps[:caps]['udid'] = device.split(" ")[0]
  $caps[:caps]['platformVersion'] = `adb shell getprop ro.build.version.release`.strip
  $caps[:caps]['app'] = "#{Dir.pwd}/apps/com.example.pocandroidapp.apk"
else
  $caps = YAML.load_file(File.expand_path("./config/digitalai/parametric_caps.yml"))
  $caps[:caps]['accessKey'] = DigitalaiConfig.digital_ai_access_key
  $caps[:caps]['app'] = "cloud:#{BaseConfig.app_name}"
  $caps[:caps]['appPackage'] = "#{BaseConfig.app_name}"
  $caps[:caps]['appActivity'] = "#{BaseConfig.app_activity}"
  if DigitalaiConfig.device_udid != "any"
    $caps['udid'] = DigitalaiConfig.device_udid
  end
  $caps[:appium_lib]['server_url'] = "#{DigitalaiConfig.digital_ai_url}/wd/hub"
end

Allure.configure do |c|
  c.results_directory = 'output/allure-results'
  c.clean_results_directory = true
  c.environment_properties = {
    os_version: "#{DigitalaiConfig.platform_version}",
    device_udid: "#{DigitalaiConfig.device_udid}"
  }
end

 begin
   Appium::Driver.new($caps, true)
   Appium.promote_appium_methods Object
 rescue Exception => e
   puts e.message
   Process.exit(0)
 end
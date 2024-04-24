module DigitalaiConfig

  @digital_ai_url = 'https://partners.experitest.com'
  def self.digital_ai_url
    @digital_ai_url
  end

  @digital_ai_access_key = ENV['dai_access_key']
  def self.digital_ai_access_key
    @digital_ai_access_key
  end

  @device_udid = ENV["device_udid"] || "any"
  def self.device_udid
    @device_udid
  end

  @platform_version= ENV["platform_version"] || "12.0"
  def self.platform_version
    @platform_version
  end

end
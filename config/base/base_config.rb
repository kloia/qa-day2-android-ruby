module BaseConfig

  @device_type = ENV['device_type'] || 'cloud'
  def self.device_type
    @device_type
  end

  @app_name = 'com.example.pocandroidapp'
  def self.app_name
    @app_name
  end

  @app_activity = '.MainActivity'
  def self.app_activity
    @app_activity
  end

  @wait_time = 15
  def self.wait_time
    @wait_time
  end

  @moderate_wait_time = 10
  def self.moderate_wait_time
    @moderate_wait_time
  end

  @short_wait_time = 5
  def self.short_wait_time
    @short_wait_time
  end

end
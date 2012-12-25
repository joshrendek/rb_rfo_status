class Setting < ActiveRecord::Base
  attr_accessible :setting_key, :setting_value

  def self.defaults 
    Setting.create(setting_key: "allow_registration", setting_value: "on") if Setting.find_by_setting_key('allow_registration').nil?
  end
end

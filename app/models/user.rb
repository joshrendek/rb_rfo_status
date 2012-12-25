class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  #
  before_create :activate_admin

  def activate_admin 
    if User.count == 0
      activated = true
    end
  end

  def auth_allowed?
    ret = true 
    if Setting.find_by_setting_key('allow_registration') == 'off' || !activated?
      ret = false 
    end
    ret
  end
  
  def active_for_authentication? 
    super && auth_allowed?
  end 

  def inactive_message 
    if !Setting.find_by_setting_key('allow_registration').try(:setting_value) == 'on' && !activated?
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end

class StatusUpdate < ActiveRecord::Base
  belongs_to :status
  attr_accessible :content, :state, :status_id

  default_scope order('id desc')
end

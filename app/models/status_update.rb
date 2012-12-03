class StatusUpdate < ActiveRecord::Base
  belongs_to :status
  attr_accessible :content, :state, :status_id
end

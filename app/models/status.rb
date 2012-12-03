class Status < ActiveRecord::Base
  attr_accessible :closed, :duration, :environment_affected, :title
  has_many :status_updates, :dependent => :destroy 

  accepts_nested_attributes_for :status_updates
end

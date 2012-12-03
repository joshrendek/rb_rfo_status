class Status < ActiveRecord::Base
  attr_accessible :closed, :duration, :environment_affected, :title, :status_updates_attributes
  has_many :status_updates, :dependent => :destroy 

  accepts_nested_attributes_for :status_updates


  scope :production, where(environment_affected: 'Production')
  scope :development, where(environment_affected: 'Development')
end

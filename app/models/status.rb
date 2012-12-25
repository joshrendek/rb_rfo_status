class Status < ActiveRecord::Base
  attr_accessible :closed, :duration, :environment_affected, :title, :status_updates_attributes, :service_integration_id, :service_integration_title
  has_many :status_updates, :dependent => :destroy 

  accepts_nested_attributes_for :status_updates

  scope :production, where(environment_affected: 'Production').order('id desc')
  scope :development, where(environment_affected: 'Development').order('id desc')

end

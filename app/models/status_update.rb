class StatusUpdate < ActiveRecord::Base
  belongs_to :status
  attr_accessible :content, :state, :status_id

  default_scope order('id desc')

  after_create :update_status_elapsed_time, :if => Proc.new { self.state == "Resolved" }


  def update_status_elapsed_time 
    minutes_resolved_in = (((Time.now - self.status.created_at))/60).round
    self.status.duration = minutes_resolved_in 
    self.status.save
  end

end

class StatusSweeper < ActionController::Caching::Sweeper
  observe Status 

  def after_create(status) 
    expire_fragment('status_index')
  end

  def after_update(status) 
    expire_action(:controller => 'statuses', :action => 'show', :id => status.id)
    expire_fragment('status_index')
  end

end

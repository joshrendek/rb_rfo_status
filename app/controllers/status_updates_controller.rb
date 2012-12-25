class StatusUpdatesController < ApplicationController
  before_filter :authenticate_user!

  # POST /status_updates
  # POST /status_updates.json
  def create
    @status = Status.find(params[:status_id])
    @status_update = @status.status_updates.build(params[:status_update])
    expire_action(:controller => 'statuses', :action => 'index')
    expire_action(:controller => 'statuses', :action => 'show', :id => @status.id)

    respond_to do |format|
      if @status_update.save
        format.html { redirect_to @status, notice: 'Status update was successfully posted.' }
        format.json { render json: @status, status: :created, location: @status_update }
      else
        format.html { render action: "new" }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_updates/1
  # DELETE /status_updates/1.json
  def destroy
    @status_update = StatusUpdate.find(params[:id])
    @status_update.destroy

    respond_to do |format|
      format.html { redirect_to status_updates_url }
      format.json { head :no_content }
    end
  end
end

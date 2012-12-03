class StatusUpdatesController < ApplicationController
  # GET /status_updates
  # GET /status_updates.json
  def index
    @status_updates = StatusUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status_updates }
    end
  end

  # GET /status_updates/1
  # GET /status_updates/1.json
  def show
    @status_update = StatusUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_update }
    end
  end

  # GET /status_updates/new
  # GET /status_updates/new.json
  def new
    @status_update = StatusUpdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_update }
    end
  end

  # GET /status_updates/1/edit
  def edit
    @status_update = StatusUpdate.find(params[:id])
  end

  # POST /status_updates
  # POST /status_updates.json
  def create
    @status_update = StatusUpdate.new(params[:status_update])

    respond_to do |format|
      if @status_update.save
        format.html { redirect_to @status_update, notice: 'Status update was successfully created.' }
        format.json { render json: @status_update, status: :created, location: @status_update }
      else
        format.html { render action: "new" }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /status_updates/1
  # PUT /status_updates/1.json
  def update
    @status_update = StatusUpdate.find(params[:id])

    respond_to do |format|
      if @status_update.update_attributes(params[:status_update])
        format.html { redirect_to @status_update, notice: 'Status update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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

class AddPagerdutyToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :service_integration_id, :string
    add_column :statuses, :service_integration_title, :string
  end
end

class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.references :status
      t.string :state
      t.text :content

      t.timestamps
    end
    add_index :status_updates, :status_id
  end
end

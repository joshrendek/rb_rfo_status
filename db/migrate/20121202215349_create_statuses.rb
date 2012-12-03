class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title
      t.integer :duration
      t.string :environment_affected
      t.boolean :closed

      t.timestamps
    end
  end
end

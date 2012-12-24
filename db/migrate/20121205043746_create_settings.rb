class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :setting_key
      t.string :setting_value

      t.timestamps
    end
  end
end

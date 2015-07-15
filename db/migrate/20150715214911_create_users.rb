class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.text :station_ids, array: true, default: []
      t.timestamps
    end
  end
end

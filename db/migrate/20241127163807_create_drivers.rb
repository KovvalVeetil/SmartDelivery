class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :current_location
      t.decimal :capacity
      t.boolean :available

      t.timestamps
    end
  end
end

class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :start_location
      t.string :end_location
      t.integer :distance

      t.timestamps
    end
  end
end

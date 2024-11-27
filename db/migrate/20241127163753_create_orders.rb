class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :pickup_location
      t.string :dropoff_location
      t.decimal :weight
      t.string :status

      t.timestamps
    end
  end
end

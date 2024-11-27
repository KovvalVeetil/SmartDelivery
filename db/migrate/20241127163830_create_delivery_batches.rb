class CreateDeliveryBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_batches do |t|
      t.string :batch_name
      t.decimal :total_weight
      t.string :status

      t.timestamps
    end
  end
end

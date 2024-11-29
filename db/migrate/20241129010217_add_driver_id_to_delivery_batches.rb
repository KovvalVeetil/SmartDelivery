class AddDriverIdToDeliveryBatches < ActiveRecord::Migration[7.1]
  def change
    add_column :delivery_batches, :driver_id, :integer
  end
end

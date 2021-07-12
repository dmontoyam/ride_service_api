class Transactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|

      t.integer "driver_id"
      t.integer "rider_id"
      t.integer "ride_services_id"
      t.string "status"
      t.float "total_amount"
      t.datetime "date"
      t.string "payment_method"

      t.timestamps
    end
  end
end

class PaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|

      t.integer "payment_source_id"
      t.string "status"
      t.string "method"

      t.timestamps
    end
  end
end

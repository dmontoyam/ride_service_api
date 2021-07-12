class AddPaymentMethodIdToRiders < ActiveRecord::Migration[6.1]
  def change
    add_column :riders, :payment_method_id, :integer
  end
end

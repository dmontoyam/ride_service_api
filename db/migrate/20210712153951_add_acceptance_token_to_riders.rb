class AddAcceptanceTokenToRiders < ActiveRecord::Migration[6.1]
  def change
    add_column :riders, :acceptance_token, :string
    add_column :riders, :payment_method, :string
  end
end

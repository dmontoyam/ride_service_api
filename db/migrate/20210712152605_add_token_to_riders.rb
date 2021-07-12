class AddTokenToRiders < ActiveRecord::Migration[6.1]
  def change
    add_column :riders, :token, :string
  end
end

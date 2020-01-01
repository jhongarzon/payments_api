class AddIsEnabledToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_enabled, :boolean
  end
end

class RenameClientPasswordColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :clients, :password, :password_digest
  end
end

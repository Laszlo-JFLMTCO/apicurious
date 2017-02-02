class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token_expires_at, :integer
  end
end

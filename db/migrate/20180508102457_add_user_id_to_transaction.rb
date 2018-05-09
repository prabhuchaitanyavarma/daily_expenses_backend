class AddUserIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :user_id, :string
    add_column :transactions, :integer, :string
  end
end

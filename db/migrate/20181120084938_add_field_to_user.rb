class AddFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :auth_code, :string
  end
end

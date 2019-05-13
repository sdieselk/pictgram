class RemovePasswordDegest < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password_degest, :string
  end
end

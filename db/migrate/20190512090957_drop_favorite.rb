class DropFavorite < ActiveRecord::Migration[5.0]
  def change
    drop_table :foverites
  end
end

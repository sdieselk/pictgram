class CreateFoverites < ActiveRecord::Migration[5.0]
  def change
    create_table :foverites do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end

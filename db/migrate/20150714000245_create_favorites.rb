class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false

      t.timestamps null: false
    end

    add_index :favorites, [:user_id, :contact_id], unique: true
    add_index :favorites, :user_id
    add_index :favorites, :contact_id
  end
end

class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :follwed_id, null: false 

      t.timestamps null: false
    end
    add_index :relationships, :follower_id
    add_index :relationships, :follwed_id
    add_index :relationships, [:follower_id, :follwed_id], unique: true
  end
end

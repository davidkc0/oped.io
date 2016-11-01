class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.text :body
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

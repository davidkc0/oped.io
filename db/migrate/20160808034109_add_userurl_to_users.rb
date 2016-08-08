class AddUserurlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userurl, :text
  end
end

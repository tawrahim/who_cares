class AddIndexToUsersEmail < ActiveRecord::Migration
  # This migration simply adds an index to the
  # users table by making sure that email is
  # unique
  def change
    add_index :users, :email, unique: true
  end
end

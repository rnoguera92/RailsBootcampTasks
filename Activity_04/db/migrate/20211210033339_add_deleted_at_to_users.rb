# frozen_string_literal: true

# migration for adding soft delete to table
class AddDeletedAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
  end
end

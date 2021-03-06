# frozen_string_literal: true

# migration for adding soft delete to table
class AddDeletedAtToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :deleted_at, :datetime
    add_index :people, :deleted_at
  end
end

# frozen_string_literal: true

# migration for adding soft delete to table
class AddDeletedAtToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :deleted_at, :datetime
    add_index :tags, :deleted_at
  end
end

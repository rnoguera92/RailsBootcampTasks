# frozen_string_literal: true

# migration for adding soft delete to table
class AddDeletedAtToTagTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :tag_types, :deleted_at, :datetime
    add_index :tag_types, :deleted_at
  end
end

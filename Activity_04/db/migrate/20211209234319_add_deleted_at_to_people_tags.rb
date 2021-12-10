# frozen_string_literal: true

# migration for adding soft delete to table
class AddDeletedAtToPeopleTags < ActiveRecord::Migration[6.1]
  def change
    add_column :people_tags, :deleted_at, :datetime
    add_index :people_tags, :deleted_at
  end
end

# frozen_string_literal: true

# migration for adding soft delete to table
class AddDeletedAtToJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    add_column :jwt_denylist, :deleted_at, :datetime
    add_index :jwt_denylist, :deleted_at
  end
end

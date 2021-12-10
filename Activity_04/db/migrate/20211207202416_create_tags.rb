# frozen_string_literal: true

# migration for tags table creation
class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :tag_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

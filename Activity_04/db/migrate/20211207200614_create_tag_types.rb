# frozen_string_literal: true

# migration for tag_types table creation
class CreateTagTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

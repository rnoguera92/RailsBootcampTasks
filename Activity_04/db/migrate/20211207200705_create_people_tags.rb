# frozen_string_literal: true

# migration for people_tags table creation
class CreatePeopleTags < ActiveRecord::Migration[6.1]
  def change
    create_table :people_tags, id: false do |t|
      t.belongs_to :person
      t.belongs_to :tag
    end
  end
end

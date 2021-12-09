# frozen_string_literal: true

class CreatePeopleTags < ActiveRecord::Migration[6.1]
  def change
    create_table :people_tags, id: false do |t|
      t.belongs_to :person
      t.belongs_to :tag
    end
  end
end

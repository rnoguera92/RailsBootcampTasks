# frozen_string_literal: true

# migration for people table creation
class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :fname
      t.string :lname
      t.string :nid
      t.string :phone_number
      t.string :address
      t.integer :person_type

      t.timestamps
    end
  end
end

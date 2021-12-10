# frozen_string_literal: true

# model for people table
class Person < ApplicationRecord
  has_and_belongs_to_many :tags
  validates :fname, presence: true
  validates :lname, presence: true
end

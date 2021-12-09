# frozen_string_literal: true

class Person < ApplicationRecord
  has_and_belongs_to_many :tags
end

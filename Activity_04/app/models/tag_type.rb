# frozen_string_literal: true

class TagType < ApplicationRecord
	validates :name, uniqueness: true
end

# frozen_string_literal: true

# base model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  acts_as_paranoid
end

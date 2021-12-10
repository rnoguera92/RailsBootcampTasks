# frozen_string_literal: true

# model for jwt deny list table, to handle logouts/blacklist
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end

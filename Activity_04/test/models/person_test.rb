# frozen_string_literal: true

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'not save without required fields' do
    person = Person.new
    assert_not person.save
  end

  test 'saving correctly' do
    person = Person.create(:fname => 'rspect', :lname => 'test', :phone_number => '12345678', :nid => '0000000000', :address => 'test address', :person_type => 1)
    assert person.save
  end
end

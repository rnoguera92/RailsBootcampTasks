# frozen_string_literal: true

require 'test_helper'

class TagTypeTest < ActiveSupport::TestCase
  test 'not save without required fields' do
    tag_type = TagType.new
    assert_not tag_type.save
  end

  test 'saving correctly' do
    tag_type = TagType.create(:name => 'Countries' )
    assert tag_type.save
  end

  test 'check for uniqueness' do
    tag_type = TagType.create(:name => 'Countries' )
    tag_type.save

    tag_type2 = TagType.create(:name => 'Countries' )
    assert_not tag_type2.save
  end
end

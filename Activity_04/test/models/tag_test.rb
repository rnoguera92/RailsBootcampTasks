# frozen_string_literal: true

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'not save without required fields' do
    tag = Tag.new
    assert_not tag.save
  end

  test 'saving correctly' do
    TagType.create(:name => 'Countries')
    tag = Tag.create(:name => 'Nicaragua', :tag_type => TagType.find(1))
    assert tag.save
  end

  test 'checking for uniqueness' do
    TagType.create(:name => 'Countries')
    tag = Tag.create(:name => 'Nicaragua', :tag_type => TagType.find(1))
    tag.save
    tag2 = Tag.create(:name => 'Nicaragua', :tag_type => TagType.find(1))
    assert_not tag2.save
  end
end

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'testCategory')
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ''
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category_too = Category.new(name: 'testCategory')
    assert_not @category_too.valid?
  end
end
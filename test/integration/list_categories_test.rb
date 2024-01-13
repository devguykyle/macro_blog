require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "testCategory")
    @categoryToo = Category.create(name: "testCategoryToo")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@categoryToo), text: @categoryToo.name
  end
end
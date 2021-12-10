require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "request list of all tests" do
    get '/api/v1/people'
    assert_response :success
  end
end
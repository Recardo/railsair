require 'test_helper'

class GeneralStoriesTest < ActionDispatch::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  test "ein Flug" do
    get '/flights/new'
    assert_equal 200, status, "/flights/new => 200"
    assert_template 'flights/new'
    post '/flights', :flight => valid_flight_attributes
    follow_redirect!
    assert_equal(200, status)
    assert_template 'flights/show'
  end
end

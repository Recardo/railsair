ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def valid_country_attributes(add_attributes={})
    {
      :code => "EG",
      :name => "Egypt"
    }.merge(add_attributes)
  end

  def valid_airport_attributes(add_attributes={})
    {
      :code => "CAI",
      :name => "Kairo",
      :country_id => 1
    }.merge(add_attributes)
  end

  def valid_flight_attributes(add_attributes={})
    {
      :nr => "RA447",
      :departure_datetime => Time.parse("2008-08-30 12:50"),
      :arrival_datetime => Time.parse("2008-08-30 13:50"),
      :departure_airport_id => airports(:dus).id,
      :arrival_airport_id => airports(:muc).id
    }.merge(add_attributes)
  end

end

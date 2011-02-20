require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = Flight.new(valid_flight_attributes)
  end

  test "should create a fly" do
    assert @flight.save
  end

  test "should require flight no" do
    flight = Flight.new(valid_flight_attributes(:nr => nil))
    assert !flight.save
  end

  test "departure airport should be an airport" do
    assert_instance_of Airport, @flight.departure_airport
  end

  test "arrival airport should be an airport" do
    assert_instance_of Airport, @flight.arrival_airport
  end

  test "should_get_the_name_of_the_departure_airport" do
    assert_equal "DUS", @flight.departure_airport.code
    assert_equal "MUC", @flight.arrival_airport.code
  end
 
end

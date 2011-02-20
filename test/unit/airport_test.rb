require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should require code" do
    airport = Airport.new(valid_airport_attributes(:code => nil))
    assert !airport.save, "save without code"
  end

  test "should require name" do
    airport = Airport.new(valid_airport_attributes(:name => nil))
    assert !airport.save, "save without name"
  end

  test "should require country_id" do
    airport = Airport.new(valid_airport_attributes(:country_id => nil))
    assert !airport.save, "save without country_id"
  end

  test "should have 4 fixtures" do
    assert_equal 4, Airport.count, "Airport have not 4 fixtures"
  end

  test "should require 3 character in code" do
    airport = Airport.new(valid_airport_attributes(:code => "BL"))
    assert !airport.save
    airport2 = Airport.new(valid_airport_attributes(:code => "BERL"))
    assert !airport2.save
  end

  test "code should be unique" do
    airport = Airport.new(valid_airport_attributes(:code => "BLN"))
    assert airport.save
    airport2 = Airport.new(valid_airport_attributes(:code => "BLN"))
    assert !airport2.save
  end

  test "should respond to country" do
    airport = airports(:dus)
    assert_respond_to airport, :country
  end

  test "should get country name" do
    airport = airports(:dus)
    assert_equal "Germany", airport.country.name
  end

end

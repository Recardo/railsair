require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  def test_should_create_a_country
    country = Country.new(valid_country_attributes)
    assert country.save
  end

  def test_should_have_3_fixtures
    assert_equal 3, Country.count
  end
  
  def test_should_destroy
    assert_equal 3, Country.count
    Country.find(:first).destroy
    assert_equal 2, Country.count
  end

  def test_should_require_code
    country = Country.new(valid_country_attributes(:code => nil))
    assert !country.save
  end

  def test_should_require_name
    country = Country.new(valid_country_attributes(:name => nil))
    assert !country.save
  end

  def test_should_require_2_characters_in_code
    country = Country.new(valid_country_attributes(:code => "E"))
    assert !country.save
    country2 = Country.new(valid_country_attributes(:code => "EGY"))
    assert !country2.save
  end

  def test_should_code_be_unique
    country = Country.new(valid_country_attributes)
    assert country.save
    country2 = Country.new(valid_country_attributes)
    assert !country2.save
  end

  def test_should_respond_to_airport
    country = countries(:germany)
    assert_respond_to country, :airports
  end
end

require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:dus_muc)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, :flight => @flight.attributes
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, :id => flights(:dus_muc).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flights(:dus_muc).id, :flight => { }
    assert_response :success
  end

  test "should update flight" do
    put :update, :id => @flight.to_param, :flight => @flight.attributes
    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, :id => flights(:dus_muc).id
    end

    assert_redirected_to flights_path
  end

  test "should_show_airport_names_in_index" do
    get :index
    assert_select 'td', 'DUS'
    assert_select 'td', 'MUC'
  end

  test "should_have_select_fields_in_edit" do
    get :edit, :id => flights(:dus_muc).id
    assert_select 'select#flight_departure_airport_id' do
      assert_select "option",'DUS'
      assert_select 'option[value=?]', airports(:dus).id
    end
  end
end

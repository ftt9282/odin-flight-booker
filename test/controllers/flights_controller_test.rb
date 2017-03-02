require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
  	get '/'
  	assert_response :success
  end
end

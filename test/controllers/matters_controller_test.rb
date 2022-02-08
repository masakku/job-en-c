require 'test_helper'

class MattersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matters_index_url
    assert_response :success
  end

end

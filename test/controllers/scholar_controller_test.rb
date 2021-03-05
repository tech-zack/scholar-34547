require 'test_helper'

class ScholarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scholar_index_url
    assert_response :success
  end

end

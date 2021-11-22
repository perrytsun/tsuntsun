require "test_helper"

class TutorialControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get tutorial_test_url
    assert_response :success
  end
end

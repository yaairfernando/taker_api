require 'test_helper'

class AssistantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assistants_index_url
    assert_response :success
  end

end

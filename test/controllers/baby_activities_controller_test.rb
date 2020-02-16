require 'test_helper'

class BabyActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get baby_activities_controller_url
    assert_response :success
  end

  test "should get index" do
    get baby_activities_index_url
    assert_response :success
  end

end

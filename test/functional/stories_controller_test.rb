require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  fixtures :projects, :stories
  test "should get index" do
    get :index,:project_id=>projects(:projects_001)
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new,:project_id=>projects(:projects_001)
    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, :story => {:title=>"ieuhe",:description=>"doaijso",:approval_criteria=>"souiajsiod" },:project_id=>projects(:projects_001)
    end

    assert_redirected_to project_story_path(projects(:projects_001),assigns(:story))
  end

  test "should show story" do
    get :show, :id => stories(:one).id,:project_id=>projects(:projects_001)
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stories(:one).id,:project_id=>projects(:projects_001)
    assert_response :success
  end

  test "should update story" do
    put :update, :id => stories(:one).id, :story => { },:project_id=>projects(:projects_001)
    assert_redirected_to project_story_path(projects(:projects_001),assigns(:story))
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete :destroy, :id => stories(:one).id,:project_id=>projects(:projects_001)
    end

    assert_redirected_to project_stories_path(projects(:projects_001))
  end
end

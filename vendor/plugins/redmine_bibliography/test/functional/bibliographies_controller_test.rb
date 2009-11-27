require File.dirname(__FILE__) + '/../test_helper'

class BibliographiesControllerTest < ActionController::TestCase
  fixtures :projects,
    :users,
    :roles,:bibliographies

  def setup
    User.current = users(:users_004)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bibliographies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bibliography" do
    assert_difference('Bibliography.count') do
      post :create, :bibliography => { }
    end

    assert_redirected_to bibliography_path(assigns(:bibliography))
  end

  test "should show bibliography" do
    get :show, :id => bibliographies(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bibliographies(:one).id
    assert_response :success
  end

  test "should update bibliography" do
    put :update, :id => bibliographies(:one).id, :bibliography => { }
    assert_redirected_to bibliography_path(assigns(:bibliography))
  end

  test "should destroy bibliography" do
    assert_difference('Bibliography.count', -1) do
      delete :destroy, :id => bibliographies(:one).id
    end

    assert_redirected_to bibliographies_path
  end
end

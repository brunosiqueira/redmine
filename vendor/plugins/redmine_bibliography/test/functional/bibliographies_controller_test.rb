require File.dirname(__FILE__) + '/../test_helper'

class BibliographiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academic_bibliographies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bibliography" do
    assert_difference('Academic::Bibliography.count') do
      post :create, :bibliography => { }
    end

    assert_redirected_to bibliography_path(assigns(:bibliography))
  end

  test "should show bibliography" do
    get :show, :id => academic_bibliographies(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => academic_bibliographies(:one).id
    assert_response :success
  end

  test "should update bibliography" do
    put :update, :id => academic_bibliographies(:one).id, :bibliography => { }
    assert_redirected_to bibliography_path(assigns(:bibliography))
  end

  test "should destroy bibliography" do
    assert_difference('Academic::Bibliography.count', -1) do
      delete :destroy, :id => academic_bibliographies(:one).id
    end

    assert_redirected_to academic_bibliographies_path
  end
end

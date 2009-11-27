require 'test_helper'

class RulesControllerTest < ActionController::TestCase
  fixtures :users,:rules
  def setup
    @controller = RulesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @request.session[:user_id] = users(:users_001).id
    Setting.default_language = 'pt-BR'
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rules)
  end

  test "should get new" do
    get :new
    assert_not_nil assigns(:rule)
    assert_response :success
  end

  test "should create rule" do
    assert_difference('Rule.count') do
      post :create, :rule => {:name=>"TestRule",:context=>"MyString",:message=>"MyString",:importance=>"low",:action=>"update" }
    end

    assert_redirected_to rule_path(assigns(:rule))
  end

  test "should show rule" do
    get :show, :id => rules(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rules(:one).id
    assert_response :success
  end

  test "should update rule" do
    put :update, :id => rules(:one).id, :rule => {:name=>"TestRule",:context=>"MyString",:message=>"MyString",:importance=>"low",:action=>"update" }
    assert_redirected_to rule_path(assigns(:rule))
  end

  test "should destroy rule" do
    assert_difference('Rule.count', -1) do
      delete :destroy, :id => rules(:one).id
    end

    assert_redirected_to rules_path
  end
end

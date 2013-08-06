require 'test_helper'

class GroupControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @g = groups(:group_A)
    @gs = groups(:group_A)
    @group = groups(:group_A)
  end
  
  def test_index
    get :index
    assert_not_nil assigns(:gs)
    assert_template :list
    assert_response :success
  end
  
  def test_show
    get :show, id: @g
    assert_response :success
  end
  
  def test_new
    get :new
    assert_not_nil assigns(:group)
    assert_response :success
  end
  
  def test_create
    assert_difference('Group.count') do
      post :create, group: { name: @group.name }
    end
    assert_redirected_to(controller: "group",action: "list")
  end
  
  def test_create_failed
    assert_difference('Group.count') do
      post :create, group: { name: nil }
    end
    assert_redirected_to(controller: "group",action: "new")
  end
  
  def test_edit
    get :edit, id: @group
    assert_response :success
  end
  
  def test_update
    put :update, id: @group, group: { name: @group.name }
    assert_redirected_to(controller: "group",action: "show",id: @group.id)
  end
  
  def test_update_failed
    put :update, id: @group, group: { name: nil }
    assert_redirected_to(controller: "group",action: "edit")
  end
  
  def test_delete
    get :delete, id: @group
    assert_response :success
  end
  
  def test_destroy
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end
    assert_redirected_to(controller: "group",action: "list")
  end
end

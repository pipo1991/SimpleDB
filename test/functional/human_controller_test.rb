require 'test_helper'

class HumanControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @ps = humen(:Human_1)
    @people = humen(:Human_1)
    @human= humen(:Human_1)
  end
  
  def test_index
    get :index
    assert_not_nil assigns(:ps)
    assert_template :list
    assert_response :success
  end
  
  def test_show
    get :show, id: @ps
    assert_response :success
  end
  
  def test_new
    get :new
    assert_not_nil assigns(:people)
    assert_response :success
  end
  
  def test_create
    assert_difference('Human.count') do
      post :create, human: { name: @people.name ,nid: @people.nid, group_id: @people.group_id,group: @people.group}
    end
    assert_redirected_to(controller: "human",action: "list")
  end
  
  def test_create_fail
    post :create, human: { name: nil}
    assert_redirected_to(controller: "human",action: "new")
  end
  
  def test_edit
    get :edit, id: @human
    assert_response :success
  end
  
  def test_update
    put :update, id: @human, human:  { name: @human.name ,nid: @human.nid, group_id: @human.group_id,group: @human.group}
    assert_redirected_to(controller: "human",action: "list")
  end

  def test_update_fail
    put :update, id: @human, human:  { name: nil}
    assert_redirected_to(controller: "human",action: "edit")
  end
  
  
  def test_delete
    get :delete, id: @people
    assert_response :success
  end
  
  def test_destroy
    assert_difference('Human.count', -1) do
      delete :destroy, id: @people
    end
    assert_redirected_to(controller: "human",action: "list")
  end
  
end

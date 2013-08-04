require 'test_helper'

class HumanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "list" do
    assert_not_nil assigns(@ps)
  end
end

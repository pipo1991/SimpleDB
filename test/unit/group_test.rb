require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_name
    g=Group.new
    g.name=nil
    assert !g.save
  end
end

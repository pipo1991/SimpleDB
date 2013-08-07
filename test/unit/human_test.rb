require 'test_helper'

class HumanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_name
    g=Human.new
    g.name=nil
    g.nid=4590
    assert !g.save
  end
  
  def test_nid
    g=Human.new
    g.name=nil
    g.nid=4590
    assert !g.save
  end
  
  def group_not_more_than_4
    g=Group.new
    g.name="Temp"
    for i in 0..10
      h=Human.new
      h.name="Human#{i}"
      h.nid=178765873
      h.group_id=1
      g.human << h
    end
    assert !g.valid?
  end
end
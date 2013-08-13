require 'test_helper'

class HumanTest < ActiveSupport::TestCase
  
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
  
  def test_group_not_more_than_4
    @g=Group.new
    @g.name="Temp"
    for i in 1..5
      @h=Human.new
      @h.name="Human#{i}"
      @h.nid=178765873+i
      @h.group_id=1
      @h.save
      @g.human << @h
    end
    @g.save
    @temp=Human.new
    @temp.group << @g
    assert !@temp.valid?
  end
end
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def test_name
    g=Group.new
    g.name=nil
    assert !g.save
  end
end

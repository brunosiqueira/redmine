# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../test_helper'

class MoveStoryToOpenedVersionRuleTest < Test::Unit::TestCase
  fixtures :issues,:versions,:stories
  def setup
    @rule = MoveStoryToOpenedVersionRule.new
  end

  def test_invalid
    story = stories(:one)
    story.version_id = versions(:versions_004).id
    assert !@rule.valid?(story)
  end

  def test_valid
    story = stories(:one)
    assert @rule.valid?(story)
  end

end

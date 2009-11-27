# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.dirname(__FILE__) + '/../../test_helper'

class TestDrivenRuleTest < Test::Unit::TestCase
  fixtures :issues,:trackers
  def setup
    @rule = TestDrivenRule.new
  end
  def test_valid
    test = issues(:issues_011_teste)
    dev = Issue.new(:tracker=>trackers(:trackers_004), :pre_requirement_id=>test.id)
    assert @rule.valid? dev
  end

  def test_valid_no_test_pre_requirement
    pre = issues(:issues_010)
    dev = Issue.new(:tracker=>trackers(:trackers_004), :pre_requirement_id=>pre.id)
    assert @rule.valid? dev
  end

  def test_invalid
    dev = Issue.new(:tracker=>trackers(:trackers_004))
    assert !@rule.valid?(dev)
  end

  def test_valid_not_development
    dev = Issue.new(:tracker=>trackers(:trackers_003))
    assert @rule.valid?(dev)
  end
end

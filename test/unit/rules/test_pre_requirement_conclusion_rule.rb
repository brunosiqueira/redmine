# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../test_helper'

class TestPreRequirementConclusionRule < Test::Unit::TestCase
  fixtures :issues,:issue_statuses
  def setup
    @rule = PreRequirementConclusionRule.new
  end
  
  def test_invalid
    test = issues(:issues_011_teste)
    dev = Issue.new(:pre_requirement_id=>test.id,:status=>issue_statuses(:issue_statuses_006))
    assert !@rule.valid?(dev)
  end

  def test_valid
    test = issues(:issues_011_teste)
    test.update_attribute :status, issue_statuses(:issue_statuses_006)
    dev = issues(:issues_010)
    dev.status = issue_statuses(:issue_statuses_006)
    assert @rule.valid?(dev)
  end

  def test_valid_no_pre_requirement
    dev = Issue.new(:status=>issue_statuses(:issue_statuses_006))
    assert @rule.valid?(dev)
  end
end

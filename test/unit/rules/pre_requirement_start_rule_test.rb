# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../test_helper'

class PreRequirementStartRuleTest < Test::Unit::TestCase
  fixtures :issues,:issue_statuses
  def setup
    @rule = PreRequirementStartRule.new
  end

  def test_invalid
    test = issues(:issues_011_teste)
    test.status=issue_statuses(:issue_statuses_001)
    dev = issues(:issues_012_desenvolvimento)
    dev.pre_requirement_id=test.id
    dev.status=issue_statuses(:issue_statuses_007)
    assert !@rule.valid?(dev)
  end

  def test_valid
    test = issues(:issues_011_teste)
    test.update_attribute :status, issue_statuses(:issue_statuses_006)
    dev = issues(:issues_012_desenvolvimento)
    dev.status = issue_statuses(:issue_statuses_006)
    assert @rule.valid?(dev)
  end

  def test_valid_no_pre_requirement
    dev = issues(:issues_012_desenvolvimento)
    dev.status=issue_statuses(:issue_statuses_006)
    assert @rule.valid?(dev)
  end
end

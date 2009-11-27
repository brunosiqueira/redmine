# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../test_helper'

class MoveIssueToFinishedVersionRuleTest < Test::Unit::TestCase
  fixtures :issues,:versions
  def setup
    @rule = MoveIssueToFinishedVersionRule.new 
  end

  def test_invalid
    issue = issues(:issues_002)
    issue.fixed_version_id = versions(:versions_004).id
    assert !@rule.valid?(issue)
  end

  def test_valid
    issue = issues(:issues_002)
    issue.fixed_version_id = versions(:versions_002).id
    assert @rule.valid?(issue)
  end

  def test_valid_2
    issue = issues(:issues_002)
    issue.fixed_version_id = versions(:versions_002).id
    assert @rule.valid?(issue)
  end
end

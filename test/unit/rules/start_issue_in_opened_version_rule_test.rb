require File.dirname(__FILE__) + '/../../test_helper'

class StartIssueInOpenedVersionRuleTest < Test::Unit::TestCase
  fixtures :issues,:versions,:issue_statuses
  def setup
    @rule = StartIssueInOpenedVersionRule.new
  end

  def test_valid
    issue = issues(:issues_002)
    issue.status_id = issue_statuses(:issue_statuses_007).id
    issue.fixed_version_id = versions(:versions_002).id
    assert @rule.valid?(issue)
  end

  def test_valid_2
    issue = issues(:issues_002)
    assert @rule.valid?(issue)
  end

  def test_invalid
    issue = issues(:issues_002)
    issue.status_id = issue_statuses(:issue_statuses_007).id
    issue.fixed_version_id = versions(:versions_001).id
    assert !@rule.valid?(issue)
  end

#  def test_invalid
#    issue = issues(:issues_002)
#    issue.fixed_version_id = versions(:versions_004).id
#    assert !@rule.valid?(issue)
#  end
end

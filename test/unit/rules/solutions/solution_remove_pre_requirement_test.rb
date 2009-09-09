# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionRemovePreRequirementTest < Test::Unit::TestCase
  fixtures :users,:projects,:issues,:issue_statuses
  def setup
    @solution = SolutionRemovePreRequirement
  end

  def test_html
    dev = issues(:issues_010)
    out = @solution::html(:issue=>dev)
    assert_match /Remover o pré-requisito/, out
  end

  def test_create
    pre = issues(:issues_011_teste)
    dev = issues(:issues_010)
    dev.status = issue_statuses(:issue_statuses_006)
    assert !dev.status.eql?(pre.status)
    assert_difference("IssuePreRequirement.count", -1) do
      assert_difference("Journal.count", 2) do
        @solution::create(:issue=>dev,:current_user=>users(:users_001))
      end
    end
    issues(:issues_010).reload
    assert_nil issues(:issues_010).pre_requirement
  end
end

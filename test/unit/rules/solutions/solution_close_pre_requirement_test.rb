# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionClosePreRequirementTest < Test::Unit::TestCase
  fixtures :users,:projects,:issues,:issue_statuses
  def setup
    @solution = SolutionClosePreRequirement
  end
  
  def test_html
    dev = issues(:issues_010)
    out = @solution.html(:issue=>dev)
    assert_match /Concluír a tarefa/, out
  end

  def test_create
    pre = issues(:issues_011_teste)
    dev = issues(:issues_010)
    dev.status = issue_statuses(:issue_statuses_006)
    assert !dev.status.eql?(pre.status)
    assert_difference("Journal.count", 1) do
      @solution.create(:issue=>dev,:current_user=>users(:users_001))
    end
    issues(:issues_011_teste).reload
    assert_equal issues(:issues_011_teste).status, issues(:issues_010).status
  end
end

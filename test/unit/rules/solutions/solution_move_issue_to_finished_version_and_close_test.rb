# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionMoveIssueToFinishedVersionAndCloseTest < Test::Unit::TestCase
  fixtures :projects,:versions,:issues,:issue_statuses
  def setup
    @solution = SolutionMoveIssueToFinishedVersionAndClose
  end

  def test_html
    out = @solution.html(:project=>projects(:projects_001))
    assert_match /Mover para a iteração finalizada e concluir a tarefa/, out
  end

  def test_create
    assert_not_equal issues(:issues_007).status, issue_statuses(:issue_statuses_006)
    @solution.create :issue=>issues(:issues_007),:params=>{:version_id=>versions(:versions_002)}
    assert_equal issues(:issues_007).status, issue_statuses(:issue_statuses_006)
  end
end

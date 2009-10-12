# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionMoveIssueToOpenVersionTest < Test::Unit::TestCase
  fixtures :projects,:versions,:issues
  def setup
    @solution = SolutionMoveIssueToOpenVersion
  end

  def test_html
    out = @solution::html(:project=>projects(:projects_001))
    assert_match /Mover a tarefa para a iteração em andamento/, out
  end

  def test_create
    assert_nil issues(:issues_007).fixed_version
    @solution::create :issue=>issues(:issues_007),:params=>{:version_id=>versions(:versions_002)}
    assert_equal versions(:versions_002),issues(:issues_007).fixed_version
  end
end

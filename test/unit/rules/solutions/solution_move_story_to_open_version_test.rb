# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionMoveStoryToOpenVersionTest < Test::Unit::TestCase
  fixtures :projects,:versions,:issues,:stories
  def setup
    @solution = SolutionMoveStoryToOpenVersion
  end

  def test_html
    stories(:one).update_attribute(:version_id,versions(:versions_002).id)
    out = @solution.html(:project=>projects(:projects_001),:story=>stories(:one))
    assert_match /Mover as seguintes tarefas para/, out
  end

  def test_create
    stories(:one).update_attribute(:version_id,versions(:versions_002).id)
    assert_nil issues(:issues_011_teste).fixed_version
    @solution.create :story=>stories(:one),:params=>{:version_id=>versions(:versions_002),:issues=>[issues(:issues_011_teste).id]}
    issues(:issues_011_teste).reload
    assert_equal versions(:versions_002).id,issues(:issues_011_teste).fixed_version_id
    assert_equal versions(:versions_002),stories(:one).version
  end
end

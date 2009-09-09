# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionTddAssociatePreRequirementTest < Test::Unit::TestCase
  fixtures :projects,:issues
  def setup
    @solution = SolutionTddAssociatePreRequirement
  end

  def test_html_with_test
    out = @solution::html(:project=>projects(:projects_005))
    assert_match /Associar tarefa a uma tarefa de teste/, out
    assert_match /#{issues(:issues_011_teste).subject}/,out
  end

  def test_html_without_test
    out = @solution::html(:project=>projects(:projects_002))
    assert_match /disabled="disabled"/,out
  end

  def test_create
    dev = issues(:issues_009)
    @solution::create(:issue=>dev,:params=>{:pre_requirement_id=>issues(:issues_011_teste).id})
    issues(:issues_009).reload
    assert_equal issues(:issues_011_teste), issues(:issues_009).pre_requirement
  end
end

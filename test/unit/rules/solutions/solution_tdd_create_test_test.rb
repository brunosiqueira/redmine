# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/../../../test_helper'
class SolutionTddCreateTestTest < Test::Unit::TestCase
  fixtures :projects,:issues
  def setup
    @solution = SolutionTddCreateTest
  end
  
  def test_html
    out = @solution.html
    assert_match /Criar uma nova tarefa de teste/, out
  end

  def test_create
    assert_difference("Issue.count", 1) do
      @solution.create :issue=>issues(:issues_010)
    end
  end
end

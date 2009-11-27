# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.dirname(__FILE__) + '/../../../test_helper'

class SolutionDoNothingTest < Test::Unit::TestCase
  def setup
    @solution = SolutionDoNothing
  end

  def test_html
    assert_match /Ignorar/,@solution.html
  end

  def test_create
    assert_difference("Version.count", 0) do
      assert_difference("Issue.count", 0) do
        @solution.create({})
      end
    end
  end
end

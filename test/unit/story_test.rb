require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  fixtures :stories
  test "should have opened issues" do
    assert_equal 2, stories(:one).opened_issues.count
  end
end

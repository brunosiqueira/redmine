# To change this template, choose Tools | Templates
# and open the template in the editor.

class TestDrivenRule
  def valid?(issue)
    if issue.is_development?
      return !issue.pre_requirement.nil?
    else
      return true
    end
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

class PreRequirementStartRule
  def valid?(issue)
    if !issue.is_default? && !issue.is_closed?
      return issue.pre_requirement.nil? ? true : !issue.pre_requirement.is_default?
    else
      return true
    end
  end
end

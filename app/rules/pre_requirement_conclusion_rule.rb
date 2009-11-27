# To change this template, choose Tools | Templates
# and open the template in the editor.

class PreRequirementConclusionRule
  def valid?(issue)
    if issue.is_closed?
      return issue.pre_requirement.nil? ? true : issue.pre_requirement.is_closed?
    else
      return true
    end
  end
end

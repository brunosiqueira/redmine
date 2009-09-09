# To change this template, choose Tools | Templates
# and open the template in the editor.

class MoveIssueToFinishedVersionRule
  def valid?(issue)
    return true if Issue.find(:first,:conditions=>["id=? and fixed_version_id=?",issue.id,issue.fixed_version_id]) || issue.fixed_version.nil?
    version = Version.find_by_id(issue.fixed_version_id)
    return version.completed?
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

class StartIssueInOpenedVersionRule
 def valid?(issue)
    started = Issue.count(:conditions=>["id=? and status_id=?",issue.id,issue.status_id])==0 && IssueStatus.count(:conditions=>["id=? and name=?",issue.status_id,"Em Andamento"])>0
    version = Version.find_by_id(issue.fixed_version_id)
    return true unless started
    return !version.nil? &&  !version.completed?
  end
end

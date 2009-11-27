class MoveStoryToOpenedVersionRule
def valid?(story)
    return true if Story.find(:first,:conditions=>["id=? and version_id=?",story.id,story.version_id]) || story.version_id.nil?
    
    return story.opened_issues.count == 0
  end
end

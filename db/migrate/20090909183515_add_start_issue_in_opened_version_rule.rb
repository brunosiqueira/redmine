class AddStartIssueInOpenedVersionRule < ActiveRecord::Migration
  def self.up
    Rule.transaction do
      rule = Rule.create! :name=>"StartIssueInOpenedVersionRule",:action=>"update",:context=>"Uma tarefa deve ser iniciada em uma iteração em andamento",:process_type=>"Issue",:importance=>"high",:message=>"rules.error.start_in_finished_version"
      rule.solutions << Solution.find_by_name("SolutionMoveIssueToOpenVersion")
      rule.solutions << Solution.find_by_name("SolutionDoNothing")
    end
  end

  def self.down
    rule = Rule.find_by_name "StartIssueInOpenedVersionRule"
    rule.destroy
  end
end

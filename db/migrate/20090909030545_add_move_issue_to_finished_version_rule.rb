class AddMoveIssueToFinishedVersionRule < ActiveRecord::Migration
  def self.up
    rule = Rule.create! :name=>"MoveIssueToFinishedVersionRule",:action=>"update",:context=>"Uma tarefa em andamento não deve ser movida para uma iteração finalizada",:process_type=>"Issue",:importance=>"high",:message=>"rules.error.move_to_finished_version"
    rule.solutions.create! :name=>"SolutionMoveIssueToFinishedVersionAndClose",:message=>"Mover tarefa para iteração concluída e concluí-la"
    rule.solutions.create! :name=>"SolutionMoveIssueToOpenVersion",:message=>"Mover tarefa para iteração aberta"
  end

  def self.down
    rule = Rule.find_by_name "MoveIssueToFinishedVersionRule"
    rule.destroy
  end
end

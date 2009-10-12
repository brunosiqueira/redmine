class AddMoveStoryToOpenedVersionRule < ActiveRecord::Migration
  def self.up
    Rule.transaction do
      rule = Rule.create! :name=>"MoveStoryToOpenedVersionRule",:action=>"update",:context=>"Tarefas que não foram concluídas devem estar na mesma iteração que seu resultado",:process_type=>"Story",:importance=>"high",:message=>"rules.error.move_story_to_opened_version"
      rule.solutions.create! :name=>"SolutionMoveStoryToOpenVersion",:message=>"Mover tarefas não concluídas para iteração do resultado"
      rule.solutions << Solution.find_by_name("SolutionDoNothing")
    end
  end

  def self.down
    rule = Rule.find_by_name "MoveStoryToOpenedVersionRule"
    rule.destroy
  end
end

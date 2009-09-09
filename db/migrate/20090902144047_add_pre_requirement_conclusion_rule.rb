class AddPreRequirementConclusionRule < ActiveRecord::Migration
  def self.up
    rule = Rule.create! :name=>"PreRequirementConclusionRule",:action=>"update",:context=>"Uma tarefa só pode ser concluída quando seu pré-requisito foi concluída",:process_type=>"Issue",:importance=>"high",:message=>"rules.error.pre_requirement_conclusion_rule"
    rule.solutions.create! :name=>"SolutionClosePreRequirement"
    rule.solutions.create! :name=>"SolutionRemovePreRequirement"
  end

  def self.down
    rule = Rule.find_by_name "PreRequirementConclusionRule"
    rule.destroy
  end
end

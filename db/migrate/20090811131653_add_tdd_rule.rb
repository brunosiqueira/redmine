class AddTddRule < ActiveRecord::Migration
  def self.up
    rule = Rule.create! :name=>"TestDrivenRule",:action=>"create",:context=>"É importante criar tarefas de teste para seu desenvolvimento.",:process_type=>"Issue",:importance=>"low",:message=>"rules.error.test_driven_rule"
    rule.solutions.create! :name=>"SolutionTddAssociatePreRequirement",:message=>"Associar tarefa de teste como pré-requisito"
    rule.solutions.create! :name=>"SolutionTddCreateTest",:message=>"Criar tarefa de teste como pré-requisito"
    rule.solutions.create! :name=>"SolutionDoNothing",:message=>"Ignorar a regra"
  end

  def self.down
    Solution.destroy_all
    Rule.destroy_all
  end
end

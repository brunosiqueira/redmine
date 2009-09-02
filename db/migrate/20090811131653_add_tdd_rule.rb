class AddTddRule < ActiveRecord::Migration
  def self.up
    rule = Rule.create! :name=>"TestDrivenRule",:action=>"create",:context=>"É importante criar tarefas de teste para seu desenvolvimento.",:process_type=>"Issue",:importance=>"low",:message=>"rules.error.test_driven_rule"
    rule.solutions.create! :name=>"SolutionTddAssociatePreRequirement"
    rule.solutions.create! :name=>"SolutionTddCreateTest"
    rule.solutions.create! :name=>"SolutionDoNothing"
  end

  def self.down
    Solution.destroy_all
    Rule.destroy_all
  end
end

class RuleLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :rule
  belongs_to :solution
  belongs_to :process, :polymorphic=>true
end

class RuleSolution < ActiveRecord::Base
  belongs_to :rule
  belongs_to :solution
end

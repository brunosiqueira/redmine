class MutualRule < ActiveRecord::Base
  belongs_to :rule_one,:class_name => "Rule",:foreign_key => "rule_one_id"
  belongs_to :rule_two,:class_name => "Rule",:foreign_key => "rule_two_id"
  validates_presence_of :rule_one_id,:rule_two_id

  def self.conflict?(rules_id)
    rules_id.each { |id|
      return true if MutualRule.count(:conditions=>["rule_one_id=? and rule_two_id in (?)",id,rules_id])>0
    }
    return false
  end
end

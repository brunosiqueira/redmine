class Rule < ActiveRecord::Base
  has_many :project_rules,:dependent=>:destroy
  has_many :projects, :through => :project_rules
  has_many :rule_solutions,:dependent=>:destroy
  has_many :solutions, :through => :rule_solutions
  validates_presence_of :name,:context,:importance,:action
  validates_uniqueness_of :name
  validates_format_of :name, :with => /^[a-zA-Z][a-z0-9A-Z_\-]+$/

  def valid_rule?(object)
    rule = self.name.constantize.new
    rule.valid?(object)
  end

  def to_s
    self.context
  end

  def self.new_rules
    files = []
    path = "app/rules/"
    Dir.glob("#{path}*.rb").each do |f|
      name = f[path.length,f.length-3-path.length].camelize
      if Rule.count(:conditions=>{:name=>name}) == 0
        files << name
      end
    end
    files
  end

  def self.process_types
    [[l(:label_issue),"Issue"],[l(:label_story),"Story"]]
  end
  def self.importances
    [[l(:label_low),"low"],[l(:label_high),"high"]]
  end

  def self.actions
    ["create","update","all"]
  end
end

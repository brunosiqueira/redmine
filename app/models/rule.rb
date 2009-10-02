class Rule < ActiveRecord::Base
  has_many :project_rules,:dependent=>:destroy
  has_many :projects, :through => :project_rules
  has_many :solutions,:dependent=>:destroy
  validates_presence_of :name,:context,:message,:importance,:action
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
    ["Issue","Story"]
  end
  def self.importances
    ["low","high"]
  end

  def self.actions
    ["create","update","all"]
  end
end

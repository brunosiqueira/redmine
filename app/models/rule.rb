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
end

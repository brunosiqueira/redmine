class RuleLogsController < ApplicationController
  before_filter :require_admin
  def index
    @rule_logs = RuleLog.find :all,:include=>[:project,:rule,:solution,:process],:order=>"created_at desc"
  end

end

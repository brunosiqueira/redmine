class MutualRulesController < ApplicationController
  before_filter :require_admin
  def index
    @rules = Rule.find :all,:order=>"name"
  end

  def update
    rules = params[:check]
    MutualRule.transaction do
      MutualRule.delete_all
      rules.each { |i|
        rules = i[0].split("_")
        MutualRule.create :rule_one_id=>rules[0], :rule_two_id=>rules[1]
      }
    end
    index
    render :action=>:index
  end

  def destroy
    
  end
end

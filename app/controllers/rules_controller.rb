class RulesController < ApplicationController
    before_filter :find_project
  def new
    @issue = @project.issues.find params[:id]
    @rules = flash[:invalid_rules]
    flash[:invalid_rules] = nil
  end

  def create
    @issue = @project.issues.find params[:id]
    @rule = @project.rules.find params[:rule_id]
    @solution = @rule.solutions.find params[:solution_id]
    @solution.name.constantize::create :project=>@project,:issue=>@issue,:params=>params, :current_user=>User.find(session[:user_id])
    render :update do |page|
      page.replace_html "rule_#{@rule.id}","<h2>Resolvido</h2>"
    end
  end


  private

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end

class RulesController < ApplicationController
  LIST = [:list,:execute]
  before_filter :find_project, :only=> LIST
  before_filter :require_admin,:except=>LIST
  layout "base"
  def index
    @rules = Rule.find :all, :order=>"name"
  end

  def show
    @rule = Rule.find params[:id]
  end

  def new    
    @rule = Rule.new
  end

  def create
    @rule = Rule.new params[:rule]
    @rule.solution_ids = params[:solutions]
    if @rule.save
      flash[:notice] =l(:notice_successful_create)
      redirect_to rule_path(@rule)
    else
      render :action=>:new
    end
  end

  def edit
    @rule = Rule.find params[:id]
  end

  def update
    @rule = Rule.find params[:id]
    @rule.solution_ids = params[:solutions]
    if @rule.update_attributes(params[:rule])
      flash[:notice] =l(:notice_successful_update)
      redirect_to rule_path(@rule)
    else
      render :action=>:edit
    end
  end

  def list
    raise "Parametro não informado" if params[:id].nil? || params[:project_id].nil? || params[:type].nil?
    @type = params[:type]
    @object = @project.send(@type.pluralize.downcase).find params[:id]
    @rules = flash[:invalid_rules]
    flash[:invalid_rules] = nil
  end

  def execute
    @object = @project.send(params[:type].pluralize.downcase).find params[:id]
    @rule = @project.rules.find params[:rule_id]
    @solution = @rule.solutions.find params[:solution_id]
    key = params[:type].downcase.to_sym
    @solution.name.constantize::create :project=>@project,key=>@object,:params=>params, :current_user=>User.find(session[:user_id])
    render :update do |page|
      page.replace_html "rule_#{@rule.id}","<h2>Resolvido</h2>"
    end
  end


  def destroy
    @rule = Rule.find params[:id]
    Rule.destroy(@rule.id)
    flash[:notice]=l(:notice_successful_delete)
    redirect_to :action=>:index
  end


  private

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end

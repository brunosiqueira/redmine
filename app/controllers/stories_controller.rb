class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.xml
  before_filter :find_project
  layout "base"
  def index
    @stories = @project.stories.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = @project.stories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = @project.stories.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])
    @story.project = @project
    @story.author = User.current
    respond_to do |format|
      if @story.save
        if !@story.invalid_rules.empty?
          flash[:invalid_rules] = @story.invalid_rules
          redirect_to(:controller=>"rules",:action=>"list",:id => @story,:project_id=>@project,:type=>"Story")
          return
        end
        flash[:notice] = l(:notice_successful_create)
        format.html { redirect_to(project_story_path(@project,@story)) }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = @project.stories.find(params[:id])

    @story.author = User.current
    respond_to do |format|
      if @story.update_attributes(params[:story])
        if !@story.invalid_rules.empty?
          flash[:invalid_rules] = @story.invalid_rules
          redirect_to(:controller=>"rules",:action=>"list",:id => @story,:project_id=>@project,:type=>"Story")
          return
        end
        flash[:notice] = l(:notice_successful_update)
        format.html { redirect_to(project_story_path(@project,@story)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = @project.stories.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(project_stories_url(@project)) }
      format.xml  { head :ok }
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end

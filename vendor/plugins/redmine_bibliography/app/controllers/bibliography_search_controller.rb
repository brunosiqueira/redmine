class BibliographySearchController < ApplicationController
  unloadable
  # GET /bibliographies
  # GET /bibliographies.xml
  before_filter :find_project, :authorize
  def index
    @bibliographies = Bibliography.find(:all,:conditions=>["not exists (select * from bibliography_projects as bp where bp.project_id=? and bp.bibliography_id = bibliographies.id)",@project.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bibliographies }
    end
  end

  def create
    @bibliography = Bibliography.find(params[:id])
    @bibliography.projects << @project
    flash[:notice] = "Bibliografia associada ao projeto"
    redirect_to :controller=>"bibliographies",:project_id=>@project
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end

class BibliographiesController < ApplicationController
  unloadable
  # GET /bibliographies
  # GET /bibliographies.xml
  before_filter :find_project, :authorize
  def index
    @bibliographies = Bibliography.find(:all,:include=>:bibliography_projects,:conditions=>["bibliography_projects.project_id=?",@project.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bibliographies }
    end
  end

  # GET /bibliographies/1
  # GET /bibliographies/1.xml
  def show
    @bibliography = BibliographyProject.find_by_bibliography_id_and_project_id(params[:id],@project.id).bibliography

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bibliography }
    end
  end

  # GET /bibliographies/new
  # GET /bibliographies/new.xml
  def new
    @type = Book.name
    @bibliography = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bibliography }
    end
  end

  # GET /bibliographies/1/edit
  def edit
    @bibliography = BibliographyProject.find_by_bibliography_id_and_project_id(params[:id],@project.id).bibliography
    @type = @bibliography[:type]
  end

  # POST /bibliographies
  # POST /bibliographies.xml
  def create
    @type = params[:type]
    @bibliography = Bibliography.find_by_title_and_type(params[:bibliography][:title],params[:bibliography][:type]) || @type.constantize.new(params[:bibliography])
    @bibliography.projects << @project
    respond_to do |format|
      if @bibliography.save
        flash[:notice] = 'Bibliography was successfully created.'
        format.html { redirect_to(:action=>:show,:id=>@bibliography,:project_id=>@project) }
        format.xml  { render :xml => @bibliography, :status => :created, :location => @bibliography }
      else
        format.html { render :action => "new",:project_id=>@project }
        format.xml  { render :xml => @bibliography.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bibliographies/1
  # PUT /bibliographies/1.xml
  def update
    @bibliography = BibliographyProject.find_by_bibliography_id_and_project_id(params[:id],@project.id).bibliography

    respond_to do |format|
      if @bibliography.update_attributes(params[:bibliography])
        flash[:notice] = 'Bibliography was successfully updated.'
        format.html { redirect_to(:action=>:show,:id=>@bibliography,:project_id=>@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit",:project_id=>@project }
        format.xml  { render :xml => @bibliography.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliographies/1
  # DELETE /bibliographies/1.xml
  def destroy
    @bibliography_project = BibliographyProject.find_by_bibliography_id_and_project_id(params[:id],@project.id)
    @bibliography_project.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>:index,:project_id=>@project) }
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

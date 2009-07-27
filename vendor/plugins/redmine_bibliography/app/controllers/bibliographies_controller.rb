class BibliographiesController < ApplicationController
  # GET /academic_bibliographies
  # GET /academic_bibliographies.xml
  before_filter :find_project, :authorize
  def index
    @bibliographies = Academic::Bibliography.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bibliographies }
    end
  end

  # GET /academic_bibliographies/1
  # GET /academic_bibliographies/1.xml
  def show
    @bibliography = Academic::Bibliography.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bibliography }
    end
  end

  # GET /academic_bibliographies/new
  # GET /academic_bibliographies/new.xml
  def new
    @type = Academic::Book.name.split("::").last
    @bibliography = Academic::Bibliography.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bibliography }
    end
  end

  # GET /academic_bibliographies/1/edit
  def edit
    @bibliography = Academic::Bibliography.find(params[:id])
  end

  # POST /academic_bibliographies
  # POST /academic_bibliographies.xml
  def create
    @type = params[:type]
    @bibliography = Academic::Bibliography.new(params[:bibliography])

    respond_to do |format|
      if @bibliography.save
        flash[:notice] = 'Academic::Bibliography was successfully created.'
        format.html { redirect_to(@bibliography) }
        format.xml  { render :xml => @bibliography, :status => :created, :location => @bibliography }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bibliography.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /academic_bibliographies/1
  # PUT /academic_bibliographies/1.xml
  def update
    @bibliography = Academic::Bibliography.find(params[:id])

    respond_to do |format|
      if @bibliography.update_attributes(params[:bibliography])
        flash[:notice] = 'Academic::Bibliography was successfully updated.'
        format.html { redirect_to(@bibliography) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bibliography.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_bibliographies/1
  # DELETE /academic_bibliographies/1.xml
  def destroy
    @bibliography = Academic::Bibliography.find(params[:id])
    @bibliography.destroy

    respond_to do |format|
      format.html { redirect_to(academic_bibliographies_url) }
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

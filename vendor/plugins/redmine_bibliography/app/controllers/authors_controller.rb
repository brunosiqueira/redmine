class AuthorsController < ApplicationController
  unloadable
  
  layout nil
  in_place_edit_for :author, :name
  before_filter :find_project, :authorize
  before_filter :find_bibliography,:except=>[:set_author_name,:get_author_name]
  
  def new
    @author = Author.new
  end

  def create
    @author = Author.new params[:author]
    @author.bibliography = @bibliography
    if @author.save
      render :update do |page|
        page.replace_html "authors",:partial=>"/authors/authors"
      end
    else
      render :update do |page|
        page.replace_html "new_author",:template=>"/authors/new"
      end
    end
  end

  def edit
    @author = @bibliography.authors.find(params[:id])
    if @author.update_attributes(params[:author])
      render :update do |page|
        page.replace_html "authors",:partial=>"/authors/authors"
      end
    else
      render :update do |page|
        page.replace_html "new_author",:template=>"/authors/new"
      end
    end
  end

  def destroy
    @author = @bibliography.authors.find(params[:id])
    id = @author.id
    @author.destroy

    render :update do |page|
      page.remove "author_#{id.to_s}"
    end
  end

  private
  def find_bibliography
    @bibliography = BibliographyProject.find_by_bibliography_id_and_project_id(params[:bibliography_id],@project.id).bibliography
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end

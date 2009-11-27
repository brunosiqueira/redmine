require 'redmine'

Redmine::Plugin.register :redmine_bibliography do
  name 'Redmine Bibliography plugin'
  author 'Bruno Siqueira'
  description 'A plugin to insert bibliographies in redmine'
  version '0.0.1'
  menu :project_menu, :bibliographies, { :controller => 'bibliographies', :action => 'index' }, :caption => 'Bibliografias',:after => :activity, :param => :project_id
  project_module :bibliographies do
    permission :view_bibliographies, :bibliographies => [:index,:show,:index_references]
    permission :add_bibliographies, {:bibliographies => [:new,:create,:change_type],:bibliography_search=>[:index,:create]}
    permission :edit_bibliographies, {:bibliographies => [:edit,:update],:authors=>[:new,:create,:edit,:update,:destroy,:set_author_name,:get_author_name]}
    permission :delete_bibliographies, :bibliographies => :destroy
  end
end

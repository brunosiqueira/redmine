class AddAcademicRoles < ActiveRecord::Migration
  ROLES = [
    ["Professor","---
- :add_project
- :edit_project
- :select_project_modules
- :manage_members
- :manage_versions
- :manage_categories
- :add_issues
- :edit_issues
- :manage_issue_relations
- :add_issue_notes
- :edit_issue_notes
- :edit_own_issue_notes
- :move_issues
- :delete_issues
- :manage_public_queries
- :save_queries
- :view_gantt
- :view_calendar
- :view_issue_watchers
- :add_issue_watchers
- :log_time
- :view_time_entries
- :edit_time_entries
- :edit_own_time_entries
- :manage_news
- :comment_news
- :manage_documents
- :view_documents
- :manage_files
- :view_files
- :manage_wiki
- :rename_wiki_pages
- :delete_wiki_pages
- :view_wiki_pages
- :view_wiki_edits
- :edit_wiki_pages
- :delete_wiki_pages_attachments
- :protect_wiki_pages
- :manage_repository
- :browse_repository
- :view_changesets
- :commit_access
- :manage_boards
- :add_messages
- :edit_messages
- :edit_own_messages
- :delete_messages
- :delete_own_messages
- :view_bibliographies
- :edit_bibliographies
- :add_bibliographies
- :delete_bibliographies
- :manage_stories
- :view_stories
"],
    ["Aluno","---
- :manage_versions
- :manage_categories
- :add_issues
- :edit_issues
- :manage_issue_relations
- :add_issue_notes
- :save_queries
- :view_gantt
- :view_calendar
- :log_time
- :view_time_entries
- :comment_news
- :view_documents
- :view_wiki_pages
- :view_wiki_edits
- :edit_wiki_pages
- :delete_wiki_pages
- :add_messages
- :edit_own_messages
- :view_files
- :manage_files
- :browse_repository
- :view_changesets
- :commit_access
- :view_bibliographies
- :add_bibliographies
- :manage_stories
- :view_stories
"],
    ["Aprendiz","---
- :add_issues
- :add_issue_notes
- :save_queries
- :view_gantt
- :view_calendar
- :log_time
- :view_time_entries
- :comment_news
- :view_documents
- :view_wiki_pages
- :view_wiki_edits
- :add_messages
- :edit_own_messages
- :view_files
- :browse_repository
- :view_changesets
- :view_bibliographies
- :view_stories
"]]
  def self.up
    ROLES.each { |name,permission|
      Role.create :name=>name,:permissions=>permission,:position=>Role.count+1,:assignable=>true
    }
  end

  def self.down
    ROLES.each { |name,permission|
      r = Role.find_by_name name
      r.destroy
    }
  end
end

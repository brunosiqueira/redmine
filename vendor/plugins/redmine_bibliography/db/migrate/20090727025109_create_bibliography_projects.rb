class CreateBibliographyProjects < ActiveRecord::Migration
  def self.up
    create_table :bibliography_projects do |t|
      t.references :project
      t.references :bibliography
    end
  end

  def self.down
    drop_table :bibliography_projects
  end
end

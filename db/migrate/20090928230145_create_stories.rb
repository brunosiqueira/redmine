class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.references :project, :null=>false
      t.references :version
      t.references :author
      t.string :title
      t.text :description
      t.text :approval_criteria
      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end

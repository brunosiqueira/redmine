class AddStoryIdToIssue < ActiveRecord::Migration
  def self.up
    add_column :issues, :story_id, :integer
  end

  def self.down
    remove_column :issues, :story_id
  end
end

class CreateIssuePreRequirements < ActiveRecord::Migration
  def self.up
    create_table :issue_pre_requirements do |t|
      t.integer :issue_pre_id
      t.integer :issue_post_id
      t.timestamps
    end
    add_index :issue_pre_requirements,[:issue_pre_id,:issue_post_id],:unique=>true
  end

  def self.down
    drop_table :issue_pre_requirements
  end
end

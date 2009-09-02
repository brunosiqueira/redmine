class CreateProjectRules < ActiveRecord::Migration
  def self.up
    create_table :project_rules do |t|
      t.references :project
      t.references :rule
      t.timestamps
    end
    add_index(:project_rules, [:project_id,:rule_id], :unique=>true)
  end

  def self.down
    drop_table :project_rules
  end
end

class CreateRuleLogs < ActiveRecord::Migration
  def self.up
    create_table :rule_logs do |t|
      t.references :project
      t.references :rule
      t.references :solution
      t.integer :process_id
      t.string :process_type
      t.timestamps
    end
  end

  def self.down
    drop_table :rule_logs
  end
end

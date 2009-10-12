class CreateRuleSolutions < ActiveRecord::Migration
  def self.up
    create_table :rule_solutions do |t|
      t.references :rule,:null=>false
      t.references :solution,:null=>false
      t.timestamps
    end
    add_index(:rule_solutions, [:rule_id,:solution_id], :unique=>true)
  end

  def self.down
    drop_table :rule_solutions
  end
end

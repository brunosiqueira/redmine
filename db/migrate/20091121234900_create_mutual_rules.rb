class CreateMutualRules < ActiveRecord::Migration
  def self.up
    create_table :mutual_rules do |t|
      t.integer :rule_one_id
      t.integer :rule_two_id
      t.timestamps
    end
  end

  def self.down
    drop_table :mutual_rules
  end
end

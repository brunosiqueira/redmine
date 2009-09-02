class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.references :rule,:nil=>false
      t.string :name,:nil=>false
      t.timestamps
    end
    add_index :solutions, [:rule_id,:id]
  end

  def self.down
    drop_table :solutions
  end
end

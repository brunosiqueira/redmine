class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :name
      t.text :context
      t.string :message
      t.string :importance
      t.string :action
      t.string :process_type
      t.timestamps
    end
    
  end

  def self.down
    drop_table :rules
  end
end

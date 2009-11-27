class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.string :name,:nil=>false
      t.string :message,:nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end

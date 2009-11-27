class AddDefaultValuesToIssuePriority < ActiveRecord::Migration
  def self.up
    IssuePriority.create(:name=>"Alta",:is_default=>false)
    IssuePriority.create(:name=>"Média",:is_default=>true)
    IssuePriority.create(:name=>"Baixa",:is_default=>false)
  end

  def self.down
    IssuePriority.destroy_all
  end
end

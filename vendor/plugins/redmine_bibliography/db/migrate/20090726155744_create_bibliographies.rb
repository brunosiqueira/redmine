class CreateBibliographies < ActiveRecord::Migration
  def self.up
    create_table :bibliographies do |t|
      t.column :title, :string
      t.column :subtitle, :string
      t.column :edition, :string
      t.column :publisher, :string
      t.column :publishing_date, :string
      t.column :pages, :string
      t.column :volumes, :string
      t.column :illustration, :string
      t.column :dimension, :string
      t.column :collection, :string
      t.column :special_notes, :string
      t.column :isbn, :string
      t.column :newspaper_title, :string
      t.column :url, :string
      t.column :local, :string
      t.column :type, :string
    end
  end

  def self.down
    drop_table :bibliographies
  end
end

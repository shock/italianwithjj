class AddCommentsToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :comments, :text
  end

  def self.down
    remove_column :students, :comments
  end
end

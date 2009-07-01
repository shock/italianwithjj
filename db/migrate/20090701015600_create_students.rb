class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :level
      t.integer :hourly_rate

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end

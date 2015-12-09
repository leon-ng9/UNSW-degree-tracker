class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :prereq
      t.integer :UOC
      t.integer :faculty
      t.timestamps null: false
    end
  end
end

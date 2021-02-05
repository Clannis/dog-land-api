class CreateTraickCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :trick_courses do |t|
      t.references :course, foreign_key: true
      t.references :trick, foreign_key: true

      t.timestamps
    end
  end
end

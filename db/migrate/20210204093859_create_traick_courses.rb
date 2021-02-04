class CreateTraickCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :traick_courses do |t|
      t.reference :course, foreign_key: true
      t.reference :trick, foreign_key: true

      t.timestamps
    end
  end
end

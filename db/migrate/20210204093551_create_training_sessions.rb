class CreateTrainingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :training_sessions do |t|
      t.datetime :starts_at
      t.string :location
      t.references :trainer, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

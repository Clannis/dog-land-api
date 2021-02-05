class CreateTrainingSessionDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :training_session_dogs do |t|
      t.references :training_session, foreign_key: true
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end

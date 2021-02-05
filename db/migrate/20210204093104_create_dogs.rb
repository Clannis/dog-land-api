class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.boolean :shots
      t.datetime :last_shot_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

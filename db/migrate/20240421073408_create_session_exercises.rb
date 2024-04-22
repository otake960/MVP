class CreateSessionExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :session_exercises do |t|
      t.integer :session_id
      t.integer :exercise_id
      t.decimal :weight
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end

class AddExerciseIdToSessionExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :session_exercises, :exercise_id, :integer
  end
end

class RemoveExerciseIdFromSessionExercises < ActiveRecord::Migration[7.0]
  def change
    remove_column :session_exercises, :exercise_id, :bigint
  end
end

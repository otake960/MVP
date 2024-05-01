class UpdateSessionExercises < ActiveRecord::Migration[7.0]
  def change
    change_column :session_exercises, :session_id, :bigint, null: false
    change_column :session_exercises, :exercise_id, :bigint, null: false

    add_foreign_key :session_exercises, :training_sessions, column: :session_id
    add_foreign_key :session_exercises, :exercises, column: :exercise_id

    add_index :session_exercises, :session_id
    add_index :session_exercises, :exercise_id
  end
end
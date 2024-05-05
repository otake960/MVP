class RenameSessionIdToTrainingSessionIdInSessionExercises < ActiveRecord::Migration[7.0]
  def change
    rename_column :session_exercises, :session_id, :training_session_id
  end
end
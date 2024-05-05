class AddNameToSessionExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :session_exercises, :name, :string
  end
end

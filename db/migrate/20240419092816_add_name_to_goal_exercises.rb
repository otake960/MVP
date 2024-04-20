class AddNameToGoalExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :goal_exercises, :name, :string
  end
end

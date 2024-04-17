class CreateGoalExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :goal_exercises do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.decimal :target_weight
      t.integer :repetitions

      t.timestamps
    end
  end
end

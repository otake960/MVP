class CreateTrainingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :training_sessions do |t|
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end

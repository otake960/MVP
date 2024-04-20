class AddEndDateAndStatusToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :end_date, :date
    add_column :goals, :status, :string
  end
end

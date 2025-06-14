class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :icon
      t.string :level
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

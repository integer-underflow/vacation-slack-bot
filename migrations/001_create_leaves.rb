class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.string :slack_user_id
      t.integer :leave_type
      t.date :date
      t.text :reason

      t.timestamps null: false
    end
  end
end

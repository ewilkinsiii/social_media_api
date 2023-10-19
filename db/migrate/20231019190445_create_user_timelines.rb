class CreateUserTimelines < ActiveRecord::Migration[7.0]
  def change
    create_table :user_timelines do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end

class CreateUserRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ratings do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.belongs_to :rater, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

class CreateScorecardsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :scorecards do |t|
      t.string :course_name
      t.integer :strokes
      t.integer :score
      t.string :date
      t.integer :user_id
    end
    
  end
end

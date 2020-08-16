class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :test
      t.string :titel
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :correct_option
      t.integer :mark
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

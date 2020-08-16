class CreateStudentTests < ActiveRecord::Migration[6.0]
  def change
    create_table :student_tests do |t|
      t.references :student
      t.references :test
      t.datetime :assign_start_date
      t.datetime :assign_end_date
      t.datetime :actual_start_date
      t.datetime :actual_end_date
      t.boolean :has_started, :default => false
      t.boolean :has_completed, :default => false
      t.integer :current_question
      t.integer :marks
      t.timestamps
    end
  end
end

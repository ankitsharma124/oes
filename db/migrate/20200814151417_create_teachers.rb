class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.references :organization
      t.string :last_name
      t.string :first_name
      t.date :dob
      t.string :gender
      t.date :joining_date
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.references :subject
      t.references :standard
      t.string :title
      t.integer :total_marks
      t.integer :total_question
      t.integer :minute_per_question
      t.boolean :negative_marking, :default => false
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.references :standard
      t.string :name
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

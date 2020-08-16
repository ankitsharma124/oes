class CreateStandards < ActiveRecord::Migration[6.0]
  def change
    create_table :standards do |t|
      t.references :organization
      t.string :name
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.datetime :create_at
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

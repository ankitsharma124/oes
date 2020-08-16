class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.boolean :is_paid, :default => false
      t.boolean :del_flag , :default => false
      t.timestamps
    end
  end
end

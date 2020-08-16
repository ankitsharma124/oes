class AddPassmarksTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :passing_marks, :integer
  end
end

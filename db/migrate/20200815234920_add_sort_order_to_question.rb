class AddSortOrderToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :sort_order, :integer
  end
end

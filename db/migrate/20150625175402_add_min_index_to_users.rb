class AddMinIndexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :min_index, :integer
  end
end

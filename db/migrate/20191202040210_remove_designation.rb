class RemoveDesignation < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :designation
  end
end

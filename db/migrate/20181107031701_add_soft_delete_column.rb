class AddSoftDeleteColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :deleted_at, :timestamp
    add_column :sessions, :deleted_at, :timestamp
    add_column :users, :deleted_at, :timestamp
  end
end

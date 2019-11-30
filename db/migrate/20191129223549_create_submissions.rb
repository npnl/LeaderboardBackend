class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.decimal :score
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

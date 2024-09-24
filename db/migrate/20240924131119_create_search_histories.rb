class CreateSearchHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :search_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :city
      t.datetime :searched_at

      t.timestamps
    end
  end
end

class AddPrefectureRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :prefecture, null: false, foreign_key: true
  end
end

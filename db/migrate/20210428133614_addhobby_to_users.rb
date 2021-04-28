class AddhobbyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :hobby, :string
  end
end

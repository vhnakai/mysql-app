class AddReferencesToTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :user, foreign_key: true
  end
end

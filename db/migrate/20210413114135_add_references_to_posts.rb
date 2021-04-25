class AddReferencesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :topic
  end
end

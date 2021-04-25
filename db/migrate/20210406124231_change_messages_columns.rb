class ChangeMessagesColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :partner_id, :integer
  end
end

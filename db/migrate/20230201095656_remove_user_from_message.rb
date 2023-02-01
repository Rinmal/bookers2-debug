class RemoveUserFromMessage < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :user, :refarence
  end
end

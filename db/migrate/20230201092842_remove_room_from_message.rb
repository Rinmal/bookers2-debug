class RemoveRoomFromMessage < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :Room, :refarence
  end
end

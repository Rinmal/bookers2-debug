class RemoveRoomFromEntry < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :Room, :refarence
  end
end

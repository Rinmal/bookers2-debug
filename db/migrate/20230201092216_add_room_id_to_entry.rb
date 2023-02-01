class AddRoomIdToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :room_id, :integer
  end
end

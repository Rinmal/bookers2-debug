class RemoveTalkFromMessage < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :talk, :text
  end
end

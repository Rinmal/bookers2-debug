class AddTalkToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :talk, :text
  end
end

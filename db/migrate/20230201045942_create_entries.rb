class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.refarence :user
      t.refarence :room

      t.timestamps
    end
  end
end

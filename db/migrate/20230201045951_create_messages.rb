class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.refarence :user
      t.refarence :room
      t.text :talk

      t.timestamps
    end
  end
end

class RemoveUserFromEntry < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :User, :refarence
  end
end

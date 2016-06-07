class RemoveFileFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :file, :string
  end
end

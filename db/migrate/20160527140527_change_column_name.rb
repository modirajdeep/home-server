class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :path, :uploadPath
  end
end

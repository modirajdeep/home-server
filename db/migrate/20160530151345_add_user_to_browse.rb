class AddUserToBrowse < ActiveRecord::Migration
  def change
    add_reference :browses, :user, index: true, foreign_key: true
  end
end

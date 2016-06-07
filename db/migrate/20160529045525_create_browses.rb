class CreateBrowses < ActiveRecord::Migration
  def change
    create_table :browses do |t|
      t.string :file

      t.timestamps null: false
    end
  end
end

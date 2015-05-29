class AddIndexToComments < ActiveRecord::Migration
  def change
    add_column :comments, :User_Id, :string
    add_index :comments, :User_Id, unique: true
  end
end

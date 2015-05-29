class AddUserToComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :User_Id
    add_reference :comments, :user, index: true, foreign_key: true
  end
end

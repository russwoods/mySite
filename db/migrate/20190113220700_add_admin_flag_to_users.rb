class AddAdminFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :users, :admin
      add_column :users, :admin, :boolean
    end
  end 
end

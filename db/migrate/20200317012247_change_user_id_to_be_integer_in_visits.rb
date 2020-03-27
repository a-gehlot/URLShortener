class ChangeUserIdToBeIntegerInVisits < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :user_id, :integer, using: 'user_id::integer'

    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

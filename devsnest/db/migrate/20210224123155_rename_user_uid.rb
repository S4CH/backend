class RenameUserUid < ActiveRecord::Migration[6.0]
  def change
  	rename_column :users, :uid, :discord_uid
  end
end

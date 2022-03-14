class AddCoOwnerIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :co_owner_id, :integer
    add_column :groups, :batch_leader_id, :integer
    add_column :groups, :slug, :string
  end
end

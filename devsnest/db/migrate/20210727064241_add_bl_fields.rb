class AddBlFields < ActiveRecord::Migration[6.0]
  def change
    add_column :batch_leader_sheets, :video_scrum, :boolean
    add_column :batch_leader_sheets, :remarks, :text
    add_column :batch_leader_sheets, :tl_tha, :string
    add_column :batch_leader_sheets, :vtl_tha, :string
  end
end

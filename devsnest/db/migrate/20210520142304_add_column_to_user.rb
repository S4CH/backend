class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :batch, :string
    add_column :users, :grad_status, :string
    add_column :users, :grad_specialization, :string
    add_column :users, :grad_year, :integer
    add_column :users, :github_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :resume_url, :string
    add_column :users, :dob, :date
    add_column :users, :college_id, :integer
    add_column :users, :registration_num, :string
    add_column :users, :grad_start, :integer
    add_column :users, :grad_end, :integer
  end
end

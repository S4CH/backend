class AddLastThaLinkToScrums < ActiveRecord::Migration[6.0]
  def change
    add_column :scrums, :last_tha_link, :string
  end
end

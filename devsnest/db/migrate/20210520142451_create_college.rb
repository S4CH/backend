class CreateCollege < ActiveRecord::Migration[6.0]
  def change
    create_table :colleges do |t|
      t.string :name
    end
  end
end

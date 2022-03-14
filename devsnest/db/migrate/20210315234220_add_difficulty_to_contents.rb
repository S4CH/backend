class AddDifficultyToContents < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :difficulty, :integer
    add_column :contents, :question_type, :integer
  end
end

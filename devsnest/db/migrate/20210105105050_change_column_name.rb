# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :mentee_feedbacks, :efforts, :effort
  end
end

class AddStatusToTaskies < ActiveRecord::Migration[5.0]
  def change
    add_column :taskies, :status, :string
  end
end

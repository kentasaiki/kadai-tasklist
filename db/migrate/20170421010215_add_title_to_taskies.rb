class AddTitleToTaskies < ActiveRecord::Migration[5.0]
  def change
    add_column :taskies, :title, :string
  end
end

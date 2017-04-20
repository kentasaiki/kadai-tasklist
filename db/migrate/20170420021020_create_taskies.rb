class CreateTaskies < ActiveRecord::Migration[5.0]
  def change
    create_table :taskies do |t|
      t.string :content

      t.timestamps
    end
  end
end

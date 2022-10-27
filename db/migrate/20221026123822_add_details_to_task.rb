class AddDetailsToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :details, :string
  end
end

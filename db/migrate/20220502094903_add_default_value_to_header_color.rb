class AddDefaultValueToHeaderColor < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :header_color, :string, default: "#510317"
  end

  def down
    change_column :users, :header_color, :string, default: nil
  end
end

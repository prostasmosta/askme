class AddDefaultValueToHidden < ActiveRecord::Migration[7.0]
  def up
    change_column :questions, :hidden, :boolean, default: false
  end

  def down
    change_column :questions, :hidden, :boolean, default: nil
  end
end

class AddBinToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bin, :string
  end
end

class AddAmountToBins < ActiveRecord::Migration[6.0]
  def change
    add_column :bins, :amount, :int
  end
end

class AddProportionToColor < ActiveRecord::Migration[7.1]
  def change
    add_column :colors, :proportion, :integer
  end
end

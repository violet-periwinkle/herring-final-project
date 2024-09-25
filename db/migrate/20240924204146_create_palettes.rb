class CreatePalettes < ActiveRecord::Migration[7.1]
  def change
    create_table :palettes do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :background
      t.string :layout
      t.integer :spacing

      t.timestamps
    end
  end
end

class CreateColors < ActiveRecord::Migration[7.1]
  def change
    create_table :colors do |t|
      t.string :hex_code
      t.references :palette, null: false, foreign_key: true

      t.timestamps
    end
  end
end

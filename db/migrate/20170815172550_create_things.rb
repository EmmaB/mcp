class CreateThings < ActiveRecord::Migration[5.1]
  def change
    create_table :things do |t|
      t.string :name
      t.string :proprietary_name
      t.string :string
      t.integer :proprietary_id

      t.timestamps
    end
  end
end

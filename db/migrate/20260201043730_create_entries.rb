class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries do |t|
      t.integer :category, null: false
      t.decimal :value, precision: 8, scale: 2, null: false
      t.datetime :recorded_at, null: false

      t.timestamps
    end

    add_index :entries, :category
    add_index :entries, :recorded_at
  end
end

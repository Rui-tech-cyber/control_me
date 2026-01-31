class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :record_date
      t.integer :value
      t.string :category
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

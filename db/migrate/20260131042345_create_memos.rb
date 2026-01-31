class CreateMemos < ActiveRecord::Migration[7.2]
  def change
    create_table :memos do |t|
      t.references :record, null: false, foreign_key: true
      t.text :body
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

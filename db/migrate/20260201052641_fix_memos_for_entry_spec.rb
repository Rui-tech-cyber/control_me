class FixMemosForEntrySpec < ActiveRecord::Migration[7.2]
  def change
    # body → content（100字制限）
    rename_column :memos, :body, :content
    change_column :memos, :content, :string, limit: 100

    # deleted_at 削除
    remove_column :memos, :deleted_at, :datetime

    # 既存 index がある場合は削除
    if index_exists?(:memos, :entry_id)
      remove_index :memos, :entry_id
    end

    # entry_id にユニーク制約
    add_index :memos, :entry_id, unique: true
  end
end

class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title, null: false          # プロトタイプの名称
      t.text :catch_copy, null: false       # キャッチコピー
      t.text :concept, null: false          # コンセプト
      t.references :user, null: false, foreign_key: true  # usersテーブルへの外部キー

      t.timestamps
    end
  end
end
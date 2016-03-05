class CreateWeightEntries < ActiveRecord::Migration
  def change
    create_table :weight_entries do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :weight_entries, [:user_id, :created_at]
  end
end

class CreateTracklists < ActiveRecord::Migration[6.0]
  def change
    create_table :tracklists do |t|
      t.integer :sequence_no, null: false
      t.references :album, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
    end
  end
end

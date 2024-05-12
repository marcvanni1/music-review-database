class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.references :song, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
    end
  end
end

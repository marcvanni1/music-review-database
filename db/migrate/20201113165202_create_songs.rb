class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.time :length, null: false
      t.text :title, null: false
    end
  end
end

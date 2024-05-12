class CreateSongByArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :song_by_artists do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
    end
  end
end

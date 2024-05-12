class CreateAlbumByArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :album_by_artists do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
    end
  end
end

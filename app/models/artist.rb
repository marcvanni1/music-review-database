class Artist < ApplicationRecord
    has_many :album_by_artist
    has_many :albums, through: :album_by_artist

    has_many :song_by_artists
    has_many :artists, through: :song_by_artist
end

class Album < ApplicationRecord
    has_many :album_by_artist
    has_many :artists, through: :album_by_artist

    has_many :tracklists
    has_many :songs, through: :tracklists

    has_many :classifications
    has_many :genres, through: :classifications

    has_many :album_reviews
    has_many :users, through: :album_reviews

    def sequence_no(song)
        Tracklist.all.where("album_id = :alb_id and song_id = :song_id", alb_id: id, song_id: song.id).first.sequence_no
    end

    def get_tracklist
        tracklist = {}
        tracklists.each do |track|
            tracklist[track.sequence_no] = Song.find(track.song_id)
        end
        tracklist.values.sort_by {|track| sequence_no(track) }
    end

    def format_genres
        uniq_genres = genres.uniq
        str = ""
        if uniq_genres.length == 1
            return uniq_genres.first.genre_name
        else
            uniq_genres.each do |gen|
                str += gen.genre_name + ", "
            end
        end
        str.delete_suffix(', ')
    end

    def avg_rating
        StoredProcedures.avg_alb_rating(id).first['avg'].to_f
    end
end

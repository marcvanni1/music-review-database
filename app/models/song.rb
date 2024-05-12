class Song < ApplicationRecord
    has_many :song_by_artist
    has_many :artists, through: :song_by_artist
    
    has_many :tracklists
    has_many :albums, through: :tracklists

    has_many :classifications
    has_many :genres, through: :classifications

    has_many :song_reviews
    has_many :users, through: :song_reviews

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
        StoredProcedures.avg_song_rating(id).first['avg'].to_f
    end
end

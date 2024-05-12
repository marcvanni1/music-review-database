class GenresController < ApplicationController
    helper_method :high_albums, :high_songs
    def show
        @genre = Genre.find(params[:id])
    end

    def search
        if params[:search] != nil
            input = params[:search].downcase
            @results = Genre.all.where("lower(genre_name) LIKE :search", search: "%"+input+"%")
        end
    end

    def high_albums
        sql_recs = StoredProcedures.high_rated_albums_in_genre(@genre.id)
        recs = []
        displayed_recs = []
        sql_recs.each do |rec|
          recs << rec['id']
        end
    
        5.times do
          if recs.size > 0
            random = rand(recs.size)
            displayed_recs << Album.where(id: recs[random]).first
            recs.delete_at(random)
          end
        end
    
        displayed_recs.uniq
    end

    def high_songs
        sql_recs = StoredProcedures.high_rated_songs_in_genre(@genre.id)
        recs = []
        displayed_recs = []
        sql_recs.each do |rec|
          recs << rec['id']
        end
    
        5.times do
          if recs.size > 0
            random = rand(recs.size)
            displayed_recs << Song.where(id: recs[random]).first
            recs.delete_at(random)
          end
        end
    
        displayed_recs.uniq
    end
end

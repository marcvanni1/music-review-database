class ArtistsController < ApplicationController
    helper_method :artist_recs

    def new
    end
    def index
        @artists = Artist.all
    end
    def show
        @artist = Artist.find(params[:id])
    end
    def search
        if params[:search] != nil
            input = params[:search].downcase
            @results = Artist.all.where("lower(name) LIKE :search", search: "%"+input+"%")
        end
    end

    def artist_recs
        sql_recs = StoredProcedures.artist_by_song(current_user.id)
        recs = []
        displayed_recs = []
        sql_recs.each do |rec|
          recs << rec['id']
        end
  
        5.times do
            if recs.size > 0
              random = rand(recs.size)
              displayed_recs << Artist.where(id: recs[random]).first
              recs.delete_at(random)
            end
          end
      
        displayed_recs.uniq
    end
end

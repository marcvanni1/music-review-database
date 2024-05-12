class AlbumsController < ApplicationController
    helper_method :album_recs, :album_follow_recs, :similar_albums

    def show
        @album = Album.find(params[:id])
    end

    def search
        if params[:search] != nil
            input = params[:search].downcase
            @results = Album.all.where("lower(title) LIKE :search", search: "%"+input+"%")
        end
    end

    def album_recs
        sql_recs = StoredProcedures.albums_by_users(current_user.id)
        recs = []
        displayed_recs = []
        sql_recs.each do |rec|
          recs << rec['album_id']
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

    def album_follow_recs
        sql_recs = StoredProcedures.albums_by_follows(current_user.id)
        recs = []
        displayed_recs = []
        sql_recs.each do |rec|
          recs << rec['album_id']
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

    def similar_albums
        sql_recs = StoredProcedures.similar_albums(@album.id)
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
end

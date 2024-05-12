class SongsController < ApplicationController
  helper_method :song_recs, :song_follow_recs, :similar_songs

    def show
        @song = Song.find(params[:id])
    end

    def search
      if params[:search] != nil
        input = params[:search].downcase
        @results = Song.all.where("lower(title) LIKE :search", search: "%"+input+"%")
        var = Artist.all.where("lower(name) LIKE :search", search: "%"+input+"%")
        var2 = []
        var.each do |x|
          var2 = var2 + SongByArtist.all.where("artist_id = :id", id: x.id)
        end
        var2.each do |x|
          @results = @results + Song.all.where("id = :id", id: x.song_id)
        end
      end
    end

    def song_recs
      sql_recs = StoredProcedures.songs_by_users(current_user.id)
      recs = []
      displayed_recs = []
      sql_recs.each do |rec|
        recs << rec['song_id']
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

  def song_follow_recs
    sql_recs = StoredProcedures.songs_by_follows(current_user.id)
    recs = []
    displayed_recs = []
    sql_recs.each do |rec|
      recs << rec['song_id']
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


  def similar_songs
    sql_recs = StoredProcedures.similar_songs(@song.id)
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

class WelcomeController < ApplicationController
  helper_method :genre_song_recs, :genre_album_recs, :highest_songs, :recent_albums, :recent_songs, :trending_albums, :trending_songs

  def index
  end

  def genre_song_recs
    sql_recs = StoredProcedures.genre_song_rec(current_user.id)
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

  def genre_album_recs
    sql_recs = StoredProcedures.genre_album_rec(current_user.id)
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

  def highest_songs
    sql_recs = StoredProcedures.highest_artists
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

  def recent_songs
    sql_recs = StoredProcedures.recently_liked_songs(current_user.id)
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

  def recent_albums
    sql_recs = StoredProcedures.recently_liked_albums(current_user.id)
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

  def trending_albums
    sql_recs = StoredProcedures.trending_albums
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

  def trending_songs
    sql_recs = StoredProcedures.trending_songs
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

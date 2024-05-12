class StoredProcedures
    def self.follow(follower, following)
        ActiveRecord::Base.connection.execute("call follow_user(" + "\"" + follower.username + "\", \"" + following.username + "\")")
    end

    def self.unfollow(follower, following)
        ActiveRecord::Base.connection.execute("call unfollow_user(" + "\"" + follower.username + "\", \"" + following.username + "\")")
    end

    def self.avg_song_rating(song_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call average_song_rating(" + song_id.to_s + ");"
    end

    def self.avg_alb_rating(alb_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call average_album_rating(" + alb_id.to_s + ");"
    end

    def self.genre_song_rec(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_songs_based_on_genre(" + user_id.to_s + ");"
    end

    def self.genre_album_rec(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_albums_based_on_genre(" + user_id.to_s + ");"
    end

    def self.highest_artists
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_highest_rated_songs();"
    end

    def self.user_song_rec(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_users_based_on_songs(" + user_id.to_s + ");"
    end

    def self.user_album_rec(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_users_based_on_albums(" + user_id.to_s + ");"
    end

    def self.recently_liked_songs(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_recently_liked_songs(" + user_id.to_s + ");"
    end

    def self.recently_liked_albums(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_recently_liked_albums(" + user_id.to_s + ");"
    end

    def self.high_rated_albums_in_genre(genre_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call highest_rated_albums_of_genre(" + genre_id.to_s + ");"
    end

    def self.high_rated_songs_in_genre(genre_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call highest_rated_songs_of_genre(" + genre_id.to_s + ");"
    end

    def self.trending_albums
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_highest_rated_albums_past_month();"
    end

    def self.trending_songs
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_highest_rated_songs_past_month();"
    end

    def self.songs_by_users(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_songs_based_on_recommended_users(" + user_id.to_s + ");"
    end

    def self.albums_by_users(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_albums_based_on_recommended_users(" + user_id.to_s + ");"
    end

    def self.artist_by_song(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_artists_based_on_songs(" + user_id.to_s + ");"
    end

    def self.albums_by_follows(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_albums_based_on_following(" + user_id.to_s + ");"
    end

    def self.songs_by_follows(user_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call recommend_songs_based_on_following(" + user_id.to_s + ");"
    end

    def self.similar_albums(album_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call similar_albums(" + album_id.to_s + ");"
    end

    def self.similar_songs(song_id)
        client = Mysql2::Client.new(ActiveRecord::Base.configurations[Rails.env.to_s].symbolize_keys)
        client.query "call similar_songs(" + song_id.to_s + ");"
    end
end
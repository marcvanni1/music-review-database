# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_20_013157) do

  create_table "album_by_artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_album_by_artists_on_album_id"
    t.index ["artist_id"], name: "index_album_by_artists_on_artist_id"
  end

  create_table "album_reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "rating"
    t.text "review"
    t.bigint "album_id", null: false
    t.bigint "user_id", null: false
    t.date "date_created", null: false
    t.index ["album_id"], name: "index_album_reviews_on_album_id"
    t.index ["user_id"], name: "index_album_reviews_on_user_id"
  end

  create_table "albums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.date "release_date", null: false
    t.binary "cover", size: :medium
  end

  create_table "artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "classifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "album_id", null: false
    t.bigint "genre_id", null: false
    t.index ["album_id"], name: "index_classifications_on_album_id"
    t.index ["genre_id"], name: "index_classifications_on_genre_id"
    t.index ["song_id"], name: "index_classifications_on_song_id"
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "following_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
    t.index ["following_id"], name: "index_follows_on_following_id"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "genre_name", null: false
  end

  create_table "song_by_artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "song_id", null: false
    t.index ["artist_id"], name: "index_song_by_artists_on_artist_id"
    t.index ["song_id"], name: "index_song_by_artists_on_song_id"
  end

  create_table "song_reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "review"
    t.bigint "rating"
    t.bigint "song_id", null: false
    t.bigint "user_id", null: false
    t.date "date_created", null: false
    t.index ["song_id"], name: "index_song_reviews_on_song_id"
    t.index ["user_id"], name: "index_song_reviews_on_user_id"
  end

  create_table "songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.time "length", null: false
    t.text "title", null: false
  end

  create_table "tracklists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "sequence_no", null: false
    t.bigint "album_id", null: false
    t.bigint "song_id", null: false
    t.index ["album_id", "sequence_no"], name: "index_tracklists_on_album_id_and_sequence_no", unique: true
    t.index ["album_id"], name: "index_tracklists_on_album_id"
    t.index ["song_id"], name: "index_tracklists_on_song_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.index "username", name: "index_username", unique: true
  end

  add_foreign_key "album_by_artists", "albums"
  add_foreign_key "album_by_artists", "artists"
  add_foreign_key "album_reviews", "albums"
  add_foreign_key "album_reviews", "users"
  add_foreign_key "classifications", "albums"
  add_foreign_key "classifications", "genres"
  add_foreign_key "classifications", "songs"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "follows", "users", column: "following_id"
  add_foreign_key "song_by_artists", "artists"
  add_foreign_key "song_by_artists", "songs"
  add_foreign_key "song_reviews", "songs"
  add_foreign_key "song_reviews", "users"
  add_foreign_key "tracklists", "albums"
  add_foreign_key "tracklists", "songs"
end

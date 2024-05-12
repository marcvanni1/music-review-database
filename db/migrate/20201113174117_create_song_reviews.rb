class CreateSongReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :song_reviews do |t|
      t.text :review
      t.integer :rating, :limit => 5
      t.references :song, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end

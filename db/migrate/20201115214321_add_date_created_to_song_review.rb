class AddDateCreatedToSongReview < ActiveRecord::Migration[6.0]
  def change
    add_column :song_reviews, :date_created, :date, null: false
  end
end

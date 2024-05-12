class AddDateCreatedToAlbumReview < ActiveRecord::Migration[6.0]
  def change
    add_column :album_reviews, :date_created, :date, null: false
  end
end

class CreateAlbumReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :album_reviews do |t|
      t.integer :rating, :limit => 5
      t.text :review
      t.references :album, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end

class AddReleaseDateToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :release_date, :date, null: false
  end
end

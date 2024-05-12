class AddCoverToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :cover, :binary, limit: 2.megabytes
  end
end

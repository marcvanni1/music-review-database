class ChangeGenreName < ActiveRecord::Migration[6.0]
  def change
    def self.up
      rename_column :genres, :name, :genre_name
    end
  
    def self.down
      rename_column :genres, :genre_name, :name
    end
  end
end

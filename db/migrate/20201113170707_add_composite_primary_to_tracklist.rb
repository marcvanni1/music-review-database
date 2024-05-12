class AddCompositePrimaryToTracklist < ActiveRecord::Migration[6.0]
  def change
    add_index :tracklists, [:album_id, :sequence_no], unique: true
  end
end

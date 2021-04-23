class UpdateArtworksAndArtworkShares < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :title, :string, null: false
    add_column :artworks, :image_url, :string, null: false
    add_column :artworks, :artist_id, :integer, null: false
    add_index :artworks, :artist_id

    add_column :artwork_shares, :artwork_id, :integer, null: false
    add_column :artwork_shares, :viewer_id, :integer, null: false
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id

  end
end

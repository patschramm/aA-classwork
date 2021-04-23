# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id }
    validates :title, :image_url, presence: true

    
    belongs_to :artist, class_name: :User, foreign_key: :artist_id
    has_many :shares, class_name: :ArtworkShare, foreign_key: :artwork_id

    has_many :shared_viewers, through: :shares, source: :viewer
    has_many :comments, dependent: :destroy
    has_many :likes, as: :likeable

end

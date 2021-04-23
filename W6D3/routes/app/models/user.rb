# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    
    has_many :artworks, foreign_key: :artist_id, dependent: :destroy
    has_many :artwork_shares, class_name: :ArtworkShare, foreign_key: :viewer_id, dependent: :destroy
    has_many :shared_artworks, through: :artwork_shares, source: :artwork
    has_many :comments, dependent: :destroy


end
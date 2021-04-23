# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: { scope: :viewer_id }
    belongs_to :viewer, class_name: :User, foreign_key: :viewer_id
    belongs_to :artwork
end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  artwork_id :bigint           not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, presence: true

    belongs_to :artwork
    belongs_to :user
    has_many :likes, as: :likeable
end

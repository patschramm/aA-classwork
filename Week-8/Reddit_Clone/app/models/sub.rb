class Sub < ApplicationRecord
    validates :description, :title, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
        class_name: :User
end

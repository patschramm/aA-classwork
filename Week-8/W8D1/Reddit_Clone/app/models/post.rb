# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  sub_id     :integer
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_sub_id     (sub_id)
#
class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :sub

    belongs_to :author,
        class_name: :User
end

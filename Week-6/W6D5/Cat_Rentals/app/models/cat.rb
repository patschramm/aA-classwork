require 'action_view'


# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = [
        "tabby",
        "green",
        "caramel",
        "teal"
    ]
    
    validates :color, inclusion: COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :name, :color, :sex, :description, presence: true

    def age_now
        # time_ago_in_words(Time.now - self.birth_date)
        age = Date.today.year - birth_date.year
        age -= 1 if Date.today < birth_date + age.years #for days before birthday
        age 
    end
end

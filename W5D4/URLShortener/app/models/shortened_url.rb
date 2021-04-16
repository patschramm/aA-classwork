require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    
    def self.random_code
        rando = SecureRandom.urlsafe_base64

        until !ShortenedUrl.exists?(rando)
            rando = SecureRandom.urlsafe_base64
        end
        return rando
    end

    def self.url_shortener(shorty, long_string)
        ShortenedUrl.new()
    end
end

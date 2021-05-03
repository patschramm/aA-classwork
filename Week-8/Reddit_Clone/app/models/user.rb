class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}
    before_validation :ensure_session_token
    
    attr_reader :password

    #SPIRE

    def has_many :subs,
        class_name: :Sub,
        foreign_key: :moderator_id

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
end

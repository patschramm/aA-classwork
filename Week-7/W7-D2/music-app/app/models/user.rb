class User < ApplicationRecord
    before_validation :ensure_session_token

    validates :password, length: { minimum: 6, allow_nil: true }
    validates :email, :session_token, :password_digest, presence: true
    validates :email, :session_token, uniqueness: true

    attr_reader :password

    #PIGERS
    #password=(password)
    #is_password?(password)
    #generate_session_token
    #ensure_session_token
    #reset_session_token!
    #self.find_by_credentials(username, password)

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        pass_obj = BCrypt::Password.new(self.password_digest)
        pass_obj.is_password?(password)
    end

    def generate_session_token
        self.session_token = SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token 
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end


end

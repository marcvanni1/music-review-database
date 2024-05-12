class User < ApplicationRecord
    
    has_many :album_reviews
    has_many :albums, through: :album_reviews


    has_many :song_reviews
    has_many :songs, through: :song_reviews

    has_many :follows
    has_many :followers, through: :follows
    has_many :followings, through: :follows

    has_secure_password

    validate :validate_user, on: :create
    validates :username, uniqueness: { message: "already exists" }

    def validate_user
        errors.add(:username, :blank, message: "cannot be blank") if username.blank?
    end

    def num_followers
        Follow.all.where(following_id: id).size
    end

    def num_following
        Follow.all.where(follower_id: id).size
    end

    def follows?(user)
        Follow.all.where(follower_id: id, following_id: user.id).size > 0
    end
end

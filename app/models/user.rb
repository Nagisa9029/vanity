class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter,:facebook]

  attachment :image
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :gourmets
  has_many :gourmetcomments, dependent: :destroy
  has_many :gourmetfavorites, dependent: :destroy
  has_many :columns
  has_many :loves, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :populars, dependent: :destroy
  has_many :gourmets, through: :populars
  has_many :contacts
  has_many :commons


  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  def self.create_facebook(auth)
    user = User.find_by(provider:auth.provider,uid:auth.uid)
    if user.present?
      user.update(token:auth.credentials.token)
    else
      user = User.create(provider:auth.provider,
      uid:auth.uid,
      username:auth.info.name,
      token:auth.credentials.token)
    end
   user
   end

   def self.create_twitter(auth)
      user = User.find_by(provider:auth.provider,uid:auth.uid)
      unless user.present?
      user = User.create(provider:auth.provider,
      uid:auth.uid,
      username:auth.info.nickname,
      token:auth.credentials.token,
      secret:auth.credentials.secret)
    end
   user
   end

   def self.new_with_session(params, session)
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        end
      else
        super
      end
   end
end

class Post < ApplicationRecord


  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :postimages, dependent: :destroy, inverse_of: :post
  accepts_nested_attributes_for :postimages, allow_destroy: true


  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end

end

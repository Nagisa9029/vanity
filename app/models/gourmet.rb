class Gourmet < ApplicationRecord

  belongs_to :user
  has_many :gourmetcomments, dependent: :destroy
  has_many :gourmetfavorites, dependent: :destroy
  has_many :gourmetimages, dependent: :destroy, inverse_of: :gourmet
  accepts_nested_attributes_for :gourmetimages, allow_destroy: true
  has_many :populars, dependent: :destroy
  has_many :users, through: :populars

  def populared_by?(user)
      populars.where(user_id: user.id).exists?
  end
  def gourmetfavorited_by?(user)
  	  gourmetfavorites.where(user_id: user.id).exists?
  end
end

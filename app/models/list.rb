class List < ApplicationRecord

  belongs_to :user
  has_many :listlovers, dependent: :destroy
  has_many :listimages, dependent: :destroy, inverse_of: :list
  accepts_nested_attributes_for :listimages, allow_destroy: true


  def listlovered_by?(user)
  	listlovers.where(user_id: user.id).exists?
  end
end

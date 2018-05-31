class Column < ApplicationRecord

  belongs_to :user
  has_many :columnimages, dependent: :destroy, inverse_of: :column
  has_many :loves, dependent: :destroy
  accepts_nested_attributes_for :columnimages, allow_destroy: true

  def loved_by?(user)
  	# return false
  	  loves.where(user_id: user.id).exists?
  end
end

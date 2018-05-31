class Popular < ApplicationRecord

  validates :user_id, :uniqueness => {:scope => :gourmet_id} #同じidを保存しない

  belongs_to :user
  belongs_to :gourmet

end

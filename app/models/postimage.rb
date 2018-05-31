class Postimage < ApplicationRecord

  attachment :image
  belongs_to :post, inverse_of: :postimages

end

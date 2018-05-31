class Gourmetimage < ApplicationRecord

  attachment :image
  belongs_to :gourmet, inverse_of: :gourmetimages

end

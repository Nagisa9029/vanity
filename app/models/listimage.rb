class Listimage < ApplicationRecord

  attachment :image
  belongs_to :list, inverse_of: :listimages

end

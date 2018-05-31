class Columnimage < ApplicationRecord

  attachment :image
  belongs_to :column, inverse_of: :columnimages

end

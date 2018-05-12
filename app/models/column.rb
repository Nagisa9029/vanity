class Column < ApplicationRecord

  attachment :image

  belong_to :uuser, dependent: :destroy

end

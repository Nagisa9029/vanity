class Love < ApplicationRecord

  belongs_to :user
  belongs_to :column

  validates :user_id, :uniqueness => {:scope => :column_id} #同じidを保存しない

end

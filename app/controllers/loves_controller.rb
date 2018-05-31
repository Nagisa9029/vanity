class LovesController < ApplicationController
before_action :authenticate_user!

  def create
    column = Column.find(params[:column_id])
    love = current_user.loves.new(column_id: column.id)
    love.save
    redirect_back(fallback_location: root_path)
  end

end 

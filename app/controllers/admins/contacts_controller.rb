class Admins::ContactsController < ApplicationController
#before_action :authenticate_admin!

  def index
  	@contact = Contact.all.reverse_order
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def update
  end

private
  def contact_params
  	params.require(:contact).permit(:contact_name,
  		                              :question,
                                    :re_question,
                                    :read_flg,
  		                              :user_id)
  end
end


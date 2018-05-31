class ContactsController < ApplicationController
before_action :authenticate_user!, only:[:index, :show]
  def new
  	@newcontact = Contact.new
  end

  def create
  	@newcontact = Contact.new(contact_params)
  	@newcontact.user_id = current_user.id
    @newcontact.read_flg = true
  	@newcontact.save
  	redirect_to contacts_path
  end

  def index
  	@contact = Contact.all.reverse_order
  end

  def show
  	@contact = Contact.find(params[:id])
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


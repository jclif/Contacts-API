class ContactsController < ApplicationController
  def index
    render :json => Contact.contacts_for_user_id(params[:user_id])
  end

  def show
    render :json => Contact.find(params[:id])
  end

  def create
    contact = Contact.new(params[:contact])
    if contact.save
      render :json => contact
    else
      render :json => contact.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    if Contact.find(params[:id]).nil?
      head :not_found
    else
      Contact.delete(params[:id])
      head :ok
    end
  end
end

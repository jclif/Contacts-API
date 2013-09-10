class GroupingsController < ApplicationController
  def create
    cs = Grouping.new(params[:grouping])
    contact = Contact.find(cs.contact_id)
    group = Group.find(cs.group_id)

    if contact.user_id == group.user_id
      render :json => cs.errors, :status => :not_found
    elsif cs.save
      render :json => cs
    else
      render :json => cs.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    if Grouping.find(params[:id]).nil?
      head :not_found
    else
      Grouping.delete(params[:id])
      head :ok
    end
  end
end

class ContactSharesController < ApplicationController
  def create
    cs = ContactShare.new(params[:contact_share])
    if cs.save
      render :json => cs
    else
      render :json => cs.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    if ContactShare.find(params[:id]).nil?
      head :not_found
    else
      ContactShare.delete(params[:id])
      head :ok
    end
  end
end

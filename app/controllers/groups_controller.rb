class GroupsController < ApplicationController
  def create
    group = Group.new(params[:group])
    if group.save
      render :json => group
    else
      render :json => group.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    if Group.find(params[:id]).nil?
      head :not_found
    else
      Group.delete(params[:id])
      head :ok
    end
  end
end

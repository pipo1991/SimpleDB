class GroupController < ApplicationController
  def index
    list
    render('list')
  end
  
  def list
    @gs=Group.all
  end
  
  def show 
    @g = Group.find(params[:id])
  end
  
  def new
    @group= Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:notice] = "Successfully created ..."
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:notice] = "Successfully uptated ..."
      redirect_to(:action => 'show',:id => @group.id)
    else
      render('edit')
    end
  end
  
  def delete
    @group = Group.find(params[:id])
  end
  
  def destroy
    Group.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted ..."
    redirect_to(:action => 'list')
  end
end

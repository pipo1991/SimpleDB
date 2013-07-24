class PeopleController < ApplicationController
  def index
    list
    render('list')
  end
  
  def list
    @ps=People.all
  end
  
  def show 
    @ps = People.find(params[:id])
  end
  
  def new
    @people= People.new
  end
  
  def create
    @people = People.new(params[:people])
    if @people.save
      flash[:notice] = "Successfully created ..."
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end
  
  def edit
    @people = People.find(params[:id])
  end
  
  def update
    @people = People.find(params[:id])
    if @people.update_attributes(params[:people])
      flash[:notice] = "Successfully uptated ..."
      redirect_to(:action => 'show',:id => @people.id)
    else
      render('edit')
    end
  end
  
  def delete
    @people = People.find(params[:id])
  end
  
  def destroy
    People.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted ..."
    redirect_to(:action => 'list')
  end
end

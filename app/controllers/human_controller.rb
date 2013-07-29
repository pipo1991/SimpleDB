class HumanController < ApplicationController
  def index
    list
    render('list')
  end
  
  def list
    @ps=Human.all
  end
  
  def show 
    @ps = Human.find(params[:id])
  end
  
  def new
    @people= Human.new
  end
  
  def create
    @people = Human.create(:name => params[:human][:name],:nid =>params[:human][:nid],:group_id => params[:human][:group_id])
    @people.group_ids = params[:human][:group_ids]
    begin
        @people.save
    rescue
       flash[:notice] = "Successfully created ..."
       redirect_to(:action => 'list')
    ensure 
    end
  end
  
  def edit
    @human = Human.find(params[:id])
  end
  
  def update
    @human = Human.find(params[:id])
    @human.name = params[:human][:name]
    @human.nid = params[:human][:nid]
    @human.group_id = params[:human][:group_id]
    @human.group_ids = params[:human][:group_ids]
    begin
        @human.save
    rescue
       flash[:notice] = "Successfully updated ..."
       redirect_to(:action => 'list')
    ensure 
    end
  end
  
  def delete
    @people = Human.find(params[:id])
  end
  
  def destroy
    Human.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted ..."
    redirect_to(:action => 'list')
  end
end
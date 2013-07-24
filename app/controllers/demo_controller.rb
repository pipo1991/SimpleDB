class DemoController < ApplicationController
  def index
    
  end
  
  def hello
    @array =['Sami','hani','Ali']
    @id = params[:id].to_i 
    @page = params[:page].to_i 
  end
  
  def other_hello
    render(:text => 'hello Everyone')
  end
end

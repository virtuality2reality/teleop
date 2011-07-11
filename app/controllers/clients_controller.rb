class ClientsController < ApplicationController
  
  def index
  end
  
  def show
    @client = Client.find(params[:id])
    add_breadcrumb @client.name, @client
    
    respond_to do |format|
      format.html
    end
  end
  
end
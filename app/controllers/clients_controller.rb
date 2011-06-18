class ClientsController < ApplicationController
  
  def show
    @client = Client.find(params[:id])
    @survey = Survey.new(:client => @client)
    
    respond_to do |format|
      format.html
    end
  end
  
end
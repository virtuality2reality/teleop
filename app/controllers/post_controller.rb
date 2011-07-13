class PostController < ApplicationController
  
  def post_calls
    client = Client.find_by_name(params[:client_name])
    if client.nil?
      render :inline => "Client introuvable"
    else
      case client.name
      when "DevisProx"
        Webservices::DevisProx.new().post_calls(client)
      end
      render :nothing => true
    end
  end
  
  def test
    render :xml => Webservices::MyIp.new().get
  end
  
end
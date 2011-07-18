# encoding: UTF-8
class Webservices::DevisProx
  include HTTParty
  
  #base_uri "localhost:3001"
  base_uri "www.devisprox.com"
  
  def post_calls(client)
    calls = client.calls.not_posted
    calls.each do |c|
      post_call(c)
    end
  end
  
  def post_call(call)
    id = "setexonline"
    idq = call.survey.ext_id
    #uri = '/stub/test'
    uri = "/daemon_incoming.php?source=#{id}&idq=#{idq}"
    
    params = {
      "idq" => idq
    }.merge(call.as_hash)
    
    result = self.class.post(uri, :body => params)
    
    if (result.code == 200 and result.body == "OK")
      call.update_attributes!(:posted_at => Time.now)
      WS_LOGGER.info "Successfully posted call[#{call.id}] to client[#{call.client.name}]: [#{params}]"
    else
      WS_LOGGER.error "Failed to post call[#{call.id}] to client[#{call.client.name}]. HTTP[#{result.code}] BODY[#{result.body.inspect}]"
    end
  end
end
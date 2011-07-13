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
    id = "544192"
    idq = call.survey.ext_id
    #uri = '/stub/test'
    uri = "/daemon_incoming.php?source=#{id}&idq=#{idq}"
    
    params = {
      "idq" => idq,
      "ip" => "12.34.56.78"
    }.merge(call.as_hash)
    
    result = self.class.post(uri, :body => params)
    
    if (result.code == 200 and result.body.blank?)
      call.update_attributes!(:posted_at => Time.now)
      WS_LOGGER.info "Successfully posted call[#{call.id}]"
    else
      WS_LOGGER.error "Failed to post call[#{call.id}] HTTP[#{result.code}] BODY[#{result.body}]"
    end
  end
end
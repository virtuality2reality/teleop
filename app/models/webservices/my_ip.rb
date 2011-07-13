class Webservices::MyIp
  include HTTParty
  
  base_uri "http://www.domaintools.com"
  
  def get
    uri = "/research/my-ip/myip.xml"
    result = self.class.get(uri)
    result.body
  end
end
class PagerDuty 
  def initialize
    @api_key = ENV['PAGERDUTY_KEY'] || ""
    @subdomain = ENV['PAGERDUTY_DOMAIN'] || ""
  end

  def get_incidents
    incidents = request 
    incidents.collect {|x| [x['id'], x['incident_key']]}
  end

  def request 
    begin
      JSON.parse(RestClient.get "https://#{@subdomain}.pagerduty.com/api/v1/incidents", 
        :authorization => "Token token=#{@api_key}", :accept => :json)['incidents']
    rescue StandardError => e 
      p e
    end
  end
end

class PagerDuty 
  def initialize
    @api_key = ENV['PAGERDUTY_KEY'] || ""
    @subdomain = ENV['PAGERDUTY_DOMAIN'] || ""
  end

  class << self 
    def incident_link(incident_id)
      "https://#{@subdomain}.pagerduty.com/incidents/#{incident_id}"
    end

    def subdomain 
      @subdomain
    end

  end


  def get_incidents
    return [] if @api_key.empty?
    incidents = request 
    incidents.collect {|x| [x['incident_key'] || x['trigger_summary_data']['subject'], x['id']]}
  end

  def request 
    begin
      JSON.parse(RestClient.get "https://#{@subdomain}.pagerduty.com/api/v1/incidents?status=triggered,acknowledged", 
                 :authorization => "Token token=#{@api_key}", :accept => :json)['incidents']
    rescue StandardError => e 
      p e
    end
  end
end

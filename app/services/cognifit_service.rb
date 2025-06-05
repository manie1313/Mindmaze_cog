# class CognifitService
#   BASE_URL = "https://api.cognifit.com".freeze

#   def self.fetch_games
#     response = HTTParty.get(
#       "#{BASE_URL}/programs/tasks",
#       query: {
#         client_id: ENV['COGNIFIT_CLIENT_ID'],
#         locales: ['en'],
#         category: 'COGNITIVE'
#       },
#       headers: { 'Accept' => 'application/json' }
#     )
#     response.parsed_response
#   rescue => e
#     Rails.logger.error "CogniFit API Error: #{e.message}"
#     []
#   end
# end

# app/services/cognifit_service.rb
class CognifitService
  BASE_URL = "https://api.cognifit.com".freeze

  def self.fetch_games
    response = HTTParty.get(
      "#{BASE_URL}/programs/tasks",
      query: {
        client_id: ENV['COGNIFIT_CLIENT_ID'],
        locales: ['en'],
        category: 'COGNITIVE'
      },
      headers: { 'Accept' => 'application/json' }
    )
    response.parsed_response
  rescue => e
    Rails.logger.error "CogniFit API Error: #{e.message}"
    []
  end

  def self.get_token(client_id, client_secret)
    response = HTTParty.post(
      "#{BASE_URL}/oauth/token",
      body: {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: "client_credentials"
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
    JSON.parse(response.body)
  rescue => e
    Rails.logger.error "CogniFit Token Error: #{e.message}"
    {}
  end
end

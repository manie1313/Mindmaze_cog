# class CognifitController < ApplicationController
#   skip_before_action :verify_authenticity_token, only: [:token]

#   def token
#     response = CognifitApiService.get_token(
#       params[:client_id],
#       params[:client_secret]
#     )
#     render json: { token: response['access_token'] }
#   end
# end


class CognifitController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_access_token
    response = Faraday.post('https://api.cognifit.com/issue-access-token') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        client_id: ENV['COGNIFIT_CLIENT_ID'],
        client_secret: ENV['COGNIFIT_CLIENT_SECRET'],
        user_token: params[:user_token]
      }.to_json
    end

    render json: JSON.parse(response.body)
  rescue => e
    Rails.logger.error("CogniFit Error: #{e.message}")
    render json: { error: "Failed to get access token" }, status: 500
  end
end

# # app/services/cognifit_service.rb
# class CognifitService
#   BASE_URL = 'https://api.cognifit.com'.freeze

#   def initialize(client_id = ENV['COGNIFIT_CLIENT_ID'])
#     @client_id = client_id
#   end

#   def sync_games
#     # Sync cognitive games
#     games_data = fetch_brain_games('en', 'COGNITIVE')
#     process_games_data(games_data) if games_data

#     # Sync math games
#     math_games_data = fetch_brain_games('en', 'MATH')
#     process_games_data(math_games_data) if math_games_data

#     # Sync language games
#     lang_games_data = fetch_brain_games('en', 'LANG')
#     process_games_data(lang_games_data) if lang_games_data
#   end

#   private

#   def fetch_brain_games(locale, category)
#     response = HTTParty.get(
#       "#{BASE_URL}/programs/tasks",
#       query: {
#         client_id: @client_id,
#         'locales[]' => locale,
#         category: category
#       },
#       headers: {
#         'Accept' => 'application/json'
#       }
#     )

#     response.success? ? response.parsed_response : nil
#   end

#   def process_games_data(games_data)
#     games_data.each do |game_data|
#       Game.find_or_create_by(external_key: game_data['key']) do |game|
#         game.name = game_data.dig('assets', 'titles', 'en') || game_data['key']
#         game.description = game_data.dig('assets', 'descriptions', 'en') || ''
#         game.image_url = game_data.dig('assets', 'images', 'icon')
#         game.platforms = {
#           iphone: game_data['iphone'],
#           ipad: game_data['ipad'],
#           android: game_data['android']
#         }
#         game.skills = game_data['skills'] || []
#         game.category = game_data['category'] || 'COGNITIVE'
#         game.game_type = :cognifit
#         game.external_data = game_data
#       end
#     end
#   end
# end

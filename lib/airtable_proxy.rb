require 'active_support/all'
require 'json'
require 'sinatra'
require 'airtable'

set :public_folder, File.dirname(__FILE__) + '/../public'

airtable_client = Airtable::Client.new(ENV['AIRTABLE_API_KEY'])
base_id = ENV['AIRTABLE_BASE_ID']
meals_table = airtable_client.table(base_id, 'Meals eaten')

def food_to_dict(food)
  {
    name: food['Name'],
    calories: food['Calories'],
    serving_size: food['Serving size'],
  }
end

get '/' do
  redirect to('/test.html')
end

get '/v0/foods' do
  content_type :json
  {
    foods: meals_table.all.map {|food| food_to_dict(food)}
  }.to_json
end

# post '/v0/set_on_display' do
#   artist_id = request.params['artist_id']
#   is_on_display = request.params['on_display'] == "true"
#   updated_artist = artists_table.update_record_fields(artist_id, {'On Display?' => is_on_display})
#   content_type :json
#   {
#     artist: artist_to_dict(updated_artist)
#   }.to_json
# end

require 'rubygems'
require 'google/api_client'

class YoutubeAdapter

  DEVELOPER_KEY = 'AIzaSyDUuV3OAjGUaKEjBsvHSY31N03_d2PKvHw'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def self.get_service
    client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
    )
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    return client, youtube
  end

  def self.search(term, order)
    client, youtube = get_service

    order = "relevance" if order.blank?

    begin
      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => term,
          :maxResults => 20,
          :order => order
        }
      )

      videos = []

      search_response.data.items.each do |search_result|
        if search_result.id.kind == 'youtube#video'
          videos << { 
            id: search_result.id.videoId, 
            title: search_result.snippet.title,
            description: search_result.snippet.description,
            thumbnail: search_result.snippet.thumbnails.medium.url
          }
        end
      end

      videos.compact

    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end

end
class YoutubeController < ApplicationController

  before_action :videos, only: [:index]

  def index
  end

  private

    def videos
      @query = params[:q]
      @videos = YoutubeAdapter.search(@query)
    end

end

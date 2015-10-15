class YoutubeController < ApplicationController
  before_action :check_session
  before_action :videos, only: [:index]

  def index
  end

  private

    def videos
      @query = params[:q]
      @videos = YoutubeAdapter.search(@query)
    end

    def check_session
      redirect_to new_person_session_path if !current_person
    end

end

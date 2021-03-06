class YoutubeController < ApplicationController
  before_action :check_session
  before_action :videos, only: [:index]

  def index
  end

  private

    def videos
      @query = params[:q]
      order = params[:order]
      @videos = YoutubeAdapter.search(@query, order)
    end

    def check_session
      if !current_person && !current_user
        redirect_to new_person_session_path
      end
    end

end

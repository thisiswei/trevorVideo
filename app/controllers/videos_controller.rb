class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC').includes(:first_person).page(params[:page]).per_page(Video::PER_PAGE)
  end
end

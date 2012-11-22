class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC').includes(:first_person).where('first_person_id != 2').page(params[:page]).per_page(Video::PER_PAGE)
  end
end

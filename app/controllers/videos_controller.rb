class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
      flash[:success] = 'Video added successfully'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end

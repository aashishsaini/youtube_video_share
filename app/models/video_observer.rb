#################################################################################
# An active record observer to extract the remote values and parse it as per DB #
#################################################################################

class VideoObserver < ActiveRecord::Observer
  def before_save(resource)
    video = Yt::Video.new url: resource.link
    resource.uid = video.id
    resource.title = video.title
    resource.likes = video.like_count
    resource.dislikes = video.dislike_count
    resource.published_at = video.published_at
    resource.description = video.description
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end

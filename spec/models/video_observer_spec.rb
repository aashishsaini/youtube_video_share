require 'rails_helper'

RSpec.describe VideoObserver, type: :observer do
  before :each do
    @observer = VideoObserver.instance
  end

  it "should acts on video before save instance and saves the title if present" do
    @video = Video.new(link: 'https://www.youtube.com/watch?v=y9kKqeoobww&ab_channel=DaveandAva-NurseryRhymesandBabySongs')
    @observer.before_save(@video)
    expect(@video.title.length).not_to be 0
    expect(@video.uid).not_to be nil
    expect(@video.likes).not_to be nil
    expect(@video.dislikes).not_to be nil
  end

  it "should acts on video before save instance and will not save the title if link is invalid" do
    @video = Video.new(link: 'https://www.youtube.com/watch?v=xy9kKqeoobww&ab_channel=DaveandAva-NurseryRhymesandBabySongs')
    @observer.before_save(@video)
    @video.save
    expect(@video.title.length).to be 0
    expect(@video.uid).not_to be nil
    expect(@video.likes).to be nil
    expect(@video.dislikes).to be nil
  end
end

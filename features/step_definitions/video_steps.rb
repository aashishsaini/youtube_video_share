Given(/^the following youtube movie link:$/) do |table|
  @user = FactoryBot.create(:user)
  table.hashes.each do |root|
    attributes = Hash[root.map { |k, v| [k.parameterize.underscore.to_sym, v] }]
    @video = Video.new
    @video.link = attributes[:link]
    @video.user_id = @user.id
    @video.save
  end
end

Given(/^(the guest|I) visits the dashboard$/) do |whoami|
  visit videos_path
end

Then(/^will be able to see all shared videos$/) do
  find('.row.yt_video.thumbnail', wait: 0)
end

Then(/^the guest will be able to identify who has shared the movie$/) do
  find('.shared-by', text: "Shared by #{User.last.email}")
end

And(/^(the guest|I) will be able to read the title of movie as "(.*?)"$/) do |whoami, title|
  find('.video-title', text: title)
end

And(/^logged in as:$/) do |table|
  table.hashes.each do |root|
    attributes = Hash[root.map { |k, v| [k.parameterize.underscore.to_sym, v] }]
    fill_in 'Email', with: attributes[:user]
    fill_in 'Password', with: attributes[:password]
    click_button "Login/Register"
  end
end

And(/^click on "(.*?)" link$/) do |link|
  click_link link
end

Then(/^will be able to see movie share form$/) do
  find('.share-youtube-form', text: 'Share a youtube movie')
end

And(/^I submits the form after filling "(.*?)" as youtube link$/) do |link|
  fill_in 'video[link]', with: link
  click_button 'Share'
end
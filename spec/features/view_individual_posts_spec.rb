require 'spec_helper'

feature 'Can view individual posts' do  
  scenario 'Can click and view a single post' do
    # create a post with factory_girl
    post = create(:post)
    # visit '/'
    visit '/'
    # click on an image link
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    # expect to be taken to the show page of our post
    expect(page.current_path).to eq(post_path(post))
  end
end 
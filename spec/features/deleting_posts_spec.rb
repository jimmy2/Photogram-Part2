require 'rails_helper'

feature 'Deleting posts' do  
  background do
    # create an example post using factory_girl
    post = create(:post, caption: 'Abs for days.')
    # visit the root route
    visit '/'
    # click on the image to 'show' the individual post
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    # click on the 'Edit Post' button to enter the edit view
    click_link 'Edit Post'
  end
  scenario 'Can delete a single post' do
    # click on the 'Delete Post' button
    click_link 'Delete Post'
    # expect to be routed to the root again.
    # expect to see the message "Problem solved!  Post deleted."
    expect(page).to have_content('Problem solved!  Post deleted.')
    # expect to not see the old post anymore.
    expect(page).to_not have_content('Abs for days.')
  end
end  
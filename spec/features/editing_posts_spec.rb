require 'rails_helper.rb'

feature 'Editing posts' do  
  background do
    # create a job with factory_girl
    job = create(:post)
    # visit the root route
    visit '/'
    # click the image of the post we created with factory_girl
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    # click the 'edit post' link
    click_link 'Edit Post'
  end
  scenario 'Blank image update' do
    # starting after the actions in the background block:
    # fill in the 'Image' field with nothing
    attach_file('Image', 'spec/files/coffee.zip')
    # click the 'Update Post' button
    click_button 'Update Post'
    # expect to see the message: 'Something is wrong with your form!'
    expect(page).to have_content("Something is wrong with your form!")
  end
  scenario 'Can edit a post' do
    # fill in 'Caption' with "Oh god, you weren’t meant to see this picture!"
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    # click the ’Update Post’ button
    click_button 'Update Post'
    # expect the page to have content saying "Post updated hombre."
    # expect the page to have content saying “Oh god, you weren’t meant to see this picture!”
    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end
end 
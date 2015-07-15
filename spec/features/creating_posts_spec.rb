require 'rails_helper.rb'

feature 'Creating posts' do  
  scenario 'can create a job' do
    # visit the root route
    visit '/'
    # click on a button to create a new post
    click_link 'New Post'
    # fill out the bits of the form that we need. 
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime' 
    # click the submit button
    click_button 'Create Post'
    # expect the page that we’re sent to to have specific text 
    expect(page).to have_content('#coffeetime')
    # expect the page to contain our photo.
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image to create a post' do  
    # visit root route
    visit '/'
    # click the 'New Post' link
    click_link 'New Post'
    # fill in the caption field (without touching the image field)
    fill_in 'Caption', with: 'No picture because YOLO'
    # click the 'Create Post' button
    click_button 'Create Post'
    # expect the page to say, "Halt, you fiend! You need an image to post here!"
    expect(page).to have_content("Halt, you fiend! You need an image to post here!")
  end 

end  
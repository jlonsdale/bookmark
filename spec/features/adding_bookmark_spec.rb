feature 'Add bookmark' do

  scenario "i can add a url to my bookmark list and view it" do

    visit('/bookmarks')
    fill_in('url', :with => 'www.test.com')
    fill_in('title', :with => 'test title')
    click_button('Add')
    expect(page).to have_content 'www.test.com'
    expect(page).to have_content 'test title'

  end
end

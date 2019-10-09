feature 'Deletes a bookmark' do

  scenario 'I can delete a bookmark and then not see it' do
    visit('/bookmarks')
    fill_in('url', :with => 'www.test.com')
    fill_in('title', :with => 'test title')
    click_button('Add')
    click_button('Delete')
    expect(page).not_to have_content 'www.test.com'
    expect(page).not_to have_content 'test title'
  end
end

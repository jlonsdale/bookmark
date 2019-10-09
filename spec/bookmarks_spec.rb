require 'bookmarks'
describe Bookmarks do

  describe '#all' do
    it 'returns an empty list of bookmarks' do
      expect(Bookmarks.all).to eq []
    end
  end

  describe '#create' do
    it 'creates a new bookmark object' do
    bookmark = Bookmarks.add_bookmark('http://www.testbookmark.com','Test Bookmark')
    expect(bookmark).to be_a Bookmarks
    expect(bookmark.id).to eq 1
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmarks.add_bookmark('http://www.testbookmark.com','Test Bookmark')
      Bookmarks.delete(bookmark.id)
      expect(Bookmarks.all).to eq []
    end
  end

end

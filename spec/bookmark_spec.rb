require 'bookmark'
require 'database_helper'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect( dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks[0].title).to eq 'Makers Academy'
      # expect(bookmarks).to include('Destroy Software')
      # expect(bookmarks).to include('Google')
    end 
  end

  describe '#create' do
   it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'www.wikipedia.org', title: 'Wikipedia')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Wikipedia'
    expect(bookmark.url).to eq 'www.wikipedia.org'
  end
end

end
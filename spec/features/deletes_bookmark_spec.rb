require 'pg'


feature 'deletes method' do
    scenario 'makes sure the bookmark is not present when deleted' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

        Bookmark.create(url: 'http://www.google.com', title:'Google')
        
        visit'/boomarks'
        click_button("Delete")
        expect(page).to not_have _content('Google')
    end
end
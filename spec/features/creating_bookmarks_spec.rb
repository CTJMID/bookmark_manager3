feature 'Adding bookmarks' do
    scenario 'A user can add bookmarks and see it when listed' do
        visit '/bookmarks/new'
        fill_in('url', with: 'www.wikipedia.org')
        fill_in('title', with: 'Wikipedia')
        click_button('Add')
        expect(page).to have_link('Wikipedia', href: 'www.wikipedia.org')
    end
end
feature 'Adding bookmarks' do
    scenario 'A user can add bookmarks and see it when listed' do
        visit '/bookmarks/new'
        fill_in('url', with: 'www.wikipedia.org')
        click_button('Add')
        expect(page).to have_content('www.wikipedia.org')
    end
end
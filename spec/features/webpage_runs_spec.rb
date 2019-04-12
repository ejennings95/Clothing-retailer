feature 'the webpage should run with the text Hello World' do
  scenario do
    visit '/'
    expect(page).to have_content "Hello World"
  end
end

feature 'there is a discount code function' do
  scenario 'you can view a discount code input field' do
    visit '/'
    expect(page).to have_css('#discount_code')
    expect(page).to have_button('discount_code_submit')
  end
end

feature 'you can view total price of shopping cart' do
  scenario 'pick first item and see price' do
    visit '/'
    click_button('add_to_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_content('Total Price: £34.00')
  end
end

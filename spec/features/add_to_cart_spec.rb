feature 'you can add item to cart' do
  scenario 'pick first item' do
    visit '/'
    click_button('add_to_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
  end

  scenario 'pick first and second item' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    expect(page).to have_button('remove_from_cart(Flip Flops, Red)')
  end
end

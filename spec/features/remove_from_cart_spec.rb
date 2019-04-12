feature 'you can remove an item from cart' do
  scenario 'pick first item and remove it' do
    visit '/'
    click_button('add_to_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
    click_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).not_to have_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
  end

  scenario 'pick first and second item and remove first' do
    visit '/'
    click_button('add_to_cart(Leather Driver Saddle Loafers, Tan)')
    click_button('add_to_cart(Flip Flops, Red)')
    expect(page).to have_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('remove_from_cart(Flip Flops, Red)')
    click_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).not_to have_button('remove_from_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('remove_from_cart(Flip Flops, Red)')
  end
end

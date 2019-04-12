feature 'you can add item to basket' do
  scenario 'pick first item' do
    visit '/'
    click_button('add_to_basket(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('remove_from_basket(Leather Driver Saddle Loafers, Tan)')
  end

  scenario 'pick first and second item' do
    visit '/'
    click_button('add_to_basket(Flip Flops, Red)')
    expect(page).to have_button('remove_from_basket(Flip Flops, Red)')
  end
end

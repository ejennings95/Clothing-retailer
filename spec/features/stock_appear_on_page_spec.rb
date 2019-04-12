feature 'you can see the list of stock on the page' do
  scenario 'pick first item' do
    visit '/'
    expect(page).to have_button('add_to_basket(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('add_to_basket(Flip Flops, Red)')
    expect(page).to have_button('add_to_basket(Flip Flops, Blue)')
    expect(page).to have_button('add_to_basket(Almond Toe Court Shoes, Patent Black)')
    expect(page).to have_button('add_to_basket(Suede Shoes, Blue)')
    expect(page).to have_button('add_to_basket(Fine Stripe Short Sleeve Shirt, Grey)')
    expect(page).to have_button('add_to_basket(Fine Stripe Short Sleeve Shirt, Green)')
    expect(page).to have_button('add_to_basket(Gold Button Cardigan, Black)')
    expect(page).to have_button('add_to_basket(Cotton Shorts, Medium Red)')
    expect(page).to have_button('add_to_basket(Sharkskin Waistcoat, Charcoal)')
    expect(page).to have_button('add_to_basket(Lightweight Patch Pocket Blazer, Deer)')
    expect(page).to have_button('add_to_basket(Bird Print Dress, Black)')
    expect(page).to have_button('add_to_basket(Mid Twist Cut­Out Dress, Pink)')
  end
end

feature 'you can see the list of stock on the page' do
  scenario 'pick first item' do
    visit '/'
    expect(page).to have_button('add_to_cart(Leather Driver Saddle Loafers, Tan)')
    expect(page).to have_button('add_to_cart(Flip Flops, Red)')
    expect(page).to have_button('add_to_cart(Flip Flops, Blue)')
    expect(page).to have_button('add_to_cart(Almond Toe Court Shoes, Patent Black)')
    expect(page).to have_button('add_to_cart(Suede Shoes, Blue)')
    expect(page).to have_button('add_to_cart(Fine Stripe Short Sleeve Shirt, Grey)')
    expect(page).to have_button('add_to_cart(Fine Stripe Short Sleeve Shirt, Green)')
    expect(page).to have_button('add_to_cart(Gold Button Cardigan, Black)')
    expect(page).to have_button('add_to_cart(Cotton Shorts, Medium Red)')
    expect(page).to have_button('add_to_cart(Sharkskin Waistcoat, Charcoal)')
    expect(page).to have_button('add_to_cart(Lightweight Patch Pocket Blazer, Deer)')
    expect(page).to have_button('add_to_cart(Bird Print Dress, Black)')
    expect(page).to have_button('add_to_cart(Mid Twist Cut­Out Dress, Pink)')
  end
end

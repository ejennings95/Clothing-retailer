feature 'there is a discount code function' do
  scenario 'you can view a discount code input field' do
    visit '/'
    expect(page).to have_css('#discount_code')
    expect(page).to have_button('discount_code_submit')
  end

  scenario 'the discounted total is shown if the code was successful' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    fill_in 'discount_code', with: "5poundsoff"
    click_button('discount_code_submit')
    expect(page).to have_content('Total Price With Discount Code Applied: £14.00')
  end

  scenario 'the discounted total is not shown if the code was unsuccessful' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    fill_in 'discount_code', with: "wrong code"
    click_button('discount_code_submit')
    expect(page).not_to have_content('Total Price With Discount Code Applied: £14.00')
  end

  scenario 'the discount code input field is shown if the code was unsuccessful' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    fill_in 'discount_code', with: "wrong code"
    click_button('discount_code_submit')
    expect(page).to have_css('#discount_code')
    expect(page).to have_button('discount_code_submit')
  end

  scenario 'successful qualification for 5 pounds off' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    fill_in 'discount_code', with: "5poundsoff"
    click_button('discount_code_submit')
    expect(page).to have_content('Total Price With Discount Code Applied: £14.00')
  end

  # scenario 'successful qualification for 10 pounds off' do
  #   visit '/'
  #   click_button('add_to_cart(Lightweight Patch Pocket Blazer, Deer)')
  #   fill_in 'discount_code', with: "5poundsoff"
  #   click_button('discount_code_submit')
  #   expect(page).to have_content('Total Price With Discount: £165.00')
  # end

  # scenario 'successful qualification for 15 pounds off' do
  #   visit '/'
  #   click_button('add_to_cart(Flip Flops, Red)')
  #   click_button('add_to_cart(Fine Stripe Short Sleeve Shirt, Grey)')
  #   fill_in 'discount_code', with: "15poundsoff"
  #   click_button('discount_code_submit')
  #   expect(page).to have_content('Total Price With Discount: £53.99')
  # end
end

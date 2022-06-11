require 'rails_helper'

describe 'the add user process' do
  it 'adds a new user' do
    visit '/'
    click_on('Sign up')
    fill_in('user_email', :with => 'capybara@test.com')
    fill_in('user_password', :with => 'test123')
    fill_in('user_password_confirmation', :with => 'test123')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end

# before(:each) do
#   product = Product.create!(name: 'Test product', cost: 10, country_of_origin: Usa)
#   Review.create!(author: 'Computer', rating: 5, content_body: 'Reprehenderit deleniti sapiente. Consequuntur occaecati quam. Sint non qui. Est ipsa ut. Officiis q.', product_id: product.id)
# end

describe 'user routes' do
  before(:each) do
    product = Product.create!(name: 'Test Product', cost: 10, country_of_origin: 'Usa')
    Review.create!(author: 'Computer', rating: 5, content_body: 'Reprehenderit deleniti sapiente. Consequuntur occaecati quam. Sint non qui. Est ipsa ut. Officiis q.', product_id: product.id)
    visit '/'
    click_on('Sign up')
    fill_in('user_email', :with => 'capybara@test.com')
    fill_in('user_password', :with => 'test123')
    fill_in('user_password_confirmation', :with => 'test123')
    click_button('Sign up')
  end
  it 'has a user create a review' do
    first(:link, 'Test Product').click
    click_button('Add a review')
    choose('5')
    fill_in('review_author', :with => 'Capybara')
    fill_in('review_content_body', :with => 'Reprehenderit deleniti sapiente. Consequuntur occaecati quam. Sint non qui. Est ipsa ut. Officiis q.')
    click_button('Create Review')
    expect(page).to have_content('Review successfully added!')
  end

  it 'has a user'
end
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

  it 'will not let a user create a new product' do
    visit '/products/new'
    expect(page).to have_content('You are not authorized for that action')
  end
end

describe 'admin routes' do
  before(:each) do
    product = Product.create!(name: 'Test Product', cost: 10, country_of_origin: 'Usa')
    Review.create!(author: 'Computer', rating: 5, content_body: 'Reprehenderit deleniti sapiente. Consequuntur occaecati quam. Sint non qui. Est ipsa ut. Officiis q.', product_id: product.id)
    visit '/'
    click_on('Sign up')
    fill_in('user_email', :with => 'capybara@test.com')
    fill_in('user_password', :with => 'test123')
    fill_in('user_password_confirmation', :with => 'test123')
    click_button('Sign up')
    User.where(email: 'capybara@test.com').update(admin: true)
    visit '/'
  end

  it 'has an admin create a product' do
    click_on('Add new product')
    fill_in('product_name', :with => 'Test Product')
    fill_in('product_cost', :with => 10)
    fill_in('product_country_of_origin', :with => 'Usa')
    click_button('Create Product')
    expect(page). to have_content('Product successfully added!')
  end

  it 'has an admin update a product' do
    first(:link, 'Test Product').click
    click_button('Edit Product')
    fill_in('product_name', :with => 'Test Update')
    fill_in('product_cost', :with => 5)
    fill_in('product_country_of_origin', :with => 'Fra')
    click_on('Update Product')
    expect(page). to have_content('Product successfully updated!')
  end

  it 'has an admin delete a product' do
    first(:link, 'Test Product').click
    click_button('Delete Product')
    expect(page). to have_no_content('Test Product')
  end
end
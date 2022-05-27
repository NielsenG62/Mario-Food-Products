require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :content_body }
  it { should validate_length_of(:content_body).is_at_least(50).is_at_most(250) }
  it { should validate_inclusion_of(:rating).in_range(1..5) }

  it 'titleizes the author of a review' do
    product = Product.create({name: 'avocado', cost: 1, country_of_origin: 'Mexico'})
    review = Review.create({product_id: product.id, author: 'gabe', rating: 5, content_body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'})
    expect(review.author).to(eq('Gabe'))
  end
end
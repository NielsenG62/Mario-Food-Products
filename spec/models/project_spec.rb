require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name } 
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it { should validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }

  it 'titleizes the name of a product' do
    product = Product.create({name: 'avocado', cost: 1, country_of_origin: 'Mexico'})
    expect(product.name).to(eq('Avocado'))
  end
  
  it 'titleizes the country_of_origin of a product' do
    product = Product.create({name: 'avocado', cost: 1, country_of_origin: 'mexico'})
    expect(product.country_of_origin).to(eq('Mexico'))
  end
end
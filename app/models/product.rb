class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0}
  validates :country_of_origin, presence: true
  before_save(:titleize_product)

  scope :usa, -> { where(country_of_origin: 'Usa')}
  scope :three_most_recent, -> { order(created_at: :desc).limit (3) }
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  def average_rating(product)
    average = 0
    count = 0
    product.reviews.each do |review|
      average += review.rating
      count += 1
    end
    (average / count.to_f).round(2)
  end

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
    end
end
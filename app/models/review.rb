class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :rating, presence: true
  validates :rating, :inclusion => 1..5
  validates :content_body, presence: true
  validates :content_body, length: { in: 50..250 }
  before_save(:titleize_review)

  private
    def titleize_review
      self.author = self.author.titleize
    end
end
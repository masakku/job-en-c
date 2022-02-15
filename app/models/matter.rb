class Matter < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  belongs_to :scheduled

  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :title, presence: true
  validates :info, presence: true
  validates :detail, presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 100_000,
                            message: 'is out of setting range' }
  validates :price, presence: true, numericality: { message: 'is invalid. Input half-width characters' }
  validates :image, presence: true
end

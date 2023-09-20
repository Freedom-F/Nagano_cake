class Item < ApplicationRecord


  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details


  has_one_attached :image


  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre, presence: true
  validates :tax_excluded_price, presence: true, numericality: { only_integer: true, greater_than: 0}

 def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
 end
end

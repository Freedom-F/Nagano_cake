class Item < ApplicationRecord

  
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details

 
  has_one_attached :image
<<<<<<< HEAD
=======

  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre, presence: true
  validates :tax_excluded_price, presence: true, numericality: { only_integer: true, greater_than: 0}

>>>>>>> origin/develop
end

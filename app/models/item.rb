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


  def add_tax_excluded_price
    (self.tax_excluded_price * 1.10).round
  end

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [width, height]).processed
end


 scope :new_arrivals, -> { where(is_new: true).order(created_at: :desc) }
 paginates_per 8

end

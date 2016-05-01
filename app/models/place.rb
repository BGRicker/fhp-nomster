class Place < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  scope :desc_order, -> { order(id: :desc) }

  validates :name, presence: true, length: { in: 2..30 }
  validates :address, presence: true, length: { in: 10..50 }
  validates :description, presence: true, length: { in: 40..400 }

end

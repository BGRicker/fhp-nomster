class Place < ActiveRecord::Base
  belongs_to :user
  scope :desc_order, -> { order(id: :desc) }

end

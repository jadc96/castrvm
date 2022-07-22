class Castle < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :department, presence: true
  validates :price_per_day, presence: true
  validates :number_of_bed, presence: true
  validates :number_of_room, presence: true
  validates :photos, presence: true

  has_many_attached :photos

  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
end

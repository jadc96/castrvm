class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :castle

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_guest, presence: true
end

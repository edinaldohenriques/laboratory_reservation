class Reservation < ApplicationRecord
  belongs_to :user

  enum reservation_type: { laboratorio: 1, infocentro: 2 }

  validates :reservation_date, presence: true
  validates :reservation_type, presence: true

  def number_laboratorio 
    self.class.laboratorio.count
  end

  def number_infocentro
    self.class.infocentro.count
  end
end

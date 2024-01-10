class User < ApplicationRecord
  has_many :reservations

  enum user_type: { chefe_de_turma: 0, professor: 1 }

  validates :name, presence: true
  validates :cpf, presence: true, length: { is: 11 }
  validates :phone, presence: true
  validates :registration_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, :registerable
end

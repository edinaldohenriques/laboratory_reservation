class User < ApplicationRecord
  has_many :reservations

  enum user_type: { chefe_de_turma: 0, professor: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, :registerable
end

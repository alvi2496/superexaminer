class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %i[admin teacher student]
end

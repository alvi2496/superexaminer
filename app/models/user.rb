class User < ApplicationRecord
  has_many :users_tests, dependent: :destroy
  has_many :tests, -> { select("#{Test.table_name}.*, #{UsersTest.table_name}.is_taken AS is_taken") },
           through: :users_tests, dependent: :destroy
  has_many :answers, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %i[admin teacher student]
end

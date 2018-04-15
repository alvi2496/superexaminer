class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :number, uniqueness: true,
                     if: :question_number_already_present?

  private

  def question_number_already_present?
    test.questions.find_by(number: number).present?
  end
end

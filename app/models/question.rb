class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :number, uniqueness: true,
                     if: :question_number_already_present?

  # scope :answer, -> { options.find_by(is_answer: true) }

  def answer
    options.find_by(is_answer: true)
  end

  def given_answer
    options.find_by(id: results.first.given_option_id)
  end

  private

  def question_number_already_present?
    test.questions.find_by(number: number).present?
  end
end

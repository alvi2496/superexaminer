class Question < ApplicationRecord
  belongs_to :test

  validates :number, uniqueness: true,
                     if: :question_number_already_present?

  private

  def question_number_already_present?
    test.questions.find_by(number: number).present?
  end
end

class Option < ApplicationRecord
  belongs_to :question

  validates :number, uniqueness: true,
            if: :option_number_already_present?

  scope :answers, -> { where(is_answer: true) }
  scope :options_of_questions, -> (questions_ids) { where(questions_id: questions_ids) }
  scope :answer, -> { find_by(is_answer: true) }
  scope :given_answer, -> (option_id) { find_by(id: option_id) }

  private

  def option_number_already_present?
    question.options.find_by(number: number).present?
  end
end

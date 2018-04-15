class Option < ApplicationRecord
  belongs_to :question

  validates :number, uniqueness: true,
            if: :option_number_already_present?

  private

  def option_number_already_present?
    question.options.find_by(number: number).present?
  end
end

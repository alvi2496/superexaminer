class Result < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def self.calculate_and_save(user, question_ids)
    answers = Option.where(question_id: question_ids).where(is_answer: true).pluck(:question_id, :id)
    given_answers = user.answers.where(question_id: question_ids).pluck(:question_id, :option)
    for i in (0..question_ids.size - 1) do
      if question_ids[i] = answers[i][0]
        if given_answers[i][1].nil?
          result = user.results.new(question_id: question_ids[i], correct_option_id: answers[i][1],
                                    given_option_id: given_answers[i][1], correctness: 0, gained_mark: 0)
          result.save
        elsif answers[i][0] == given_answers[i][0] && answers[i][1] == given_answers[i][1]
          result = user.results.new(question_id: question_ids[i], correct_option_id: answers[i][1],
                                    given_option_id: given_answers[i][1], correctness: 1, gained_mark: 1)
          result.save
        end
      end
    end
  end
end

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def self.save_answers(user_id, question_ids, answers)
    question_ids.each do |question_id|
      answer = Answer.new(user_id: user_id, question_id: question_id, option: answers["#{question_id}"])
      answer.save!
    end
    users_test = UsersTest.users_test()
  end
end

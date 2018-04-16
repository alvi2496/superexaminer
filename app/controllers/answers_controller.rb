class AnswersController < BasesController
  before_action :find_test

  def index; end

  def new
    @questions = @test.questions.order(number: :asc)
  end

  def create
    question_ids = @test.questions.order(number: :asc).pluck(:id)
    if Answer.save_answers(current_user.id, question_ids, params[:answers_of_question])
      test_is_taken_by_student
      redirect_to tests_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_is_taken_by_student
    users_test = UsersTest.users_test(current_user.id, @test.id)
    users_test.is_taken = true
    users_test.save!
  end
end

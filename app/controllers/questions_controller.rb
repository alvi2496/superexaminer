class QuestionsController < BasesController

  before_action :set_test

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      flash[:notice] = 'Question Saved'
    else
      flash[:alert] = 'Question not saved'
    end
    redirect_to questions_path(test_id: @test.id)
  end

  private

  def question_params
    params.permit(:number, :title, :mark)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end

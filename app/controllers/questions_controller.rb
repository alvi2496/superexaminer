class QuestionsController < BasesController

  before_action :set_test

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      flash[:notice] = 'Question Saved'
      redirect_to questions_path(test_id: @test.id)
    else
      flash[:alert] = 'Question not saved'
      render :new
    end

  end

  private

  def question_params
    params.require(:question).permit(:number, :title, :mark)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end

class QuestionsController < BasesController

  before_action :set_test, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      flash[:notice] = 'Question Saved'
      redirect_to new_option_path(question_id: @question.id)
    else
      flash[:alert] = 'Question not saved'
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      flash[:notice] = 'Question updated'
      redirect_to questions_path(test_id: @test.id)
    else
      flash[:alert] = 'Question not updated'
      redirect_to edit_question_path(@question)
    end
  end

  def destroy
    if @question.destroy
      flash[:notice] = 'Question deleted'
    else
      flash[:alert] = 'Error deleting question'
    end
    redirect_to questions_path(test_id: @test.id)
  end

  private

  def question_params
    params.require(:question).permit(:number, :title, :mark)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
    @test = @question.test
  end
end

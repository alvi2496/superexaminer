class OptionsController < BasesController
  before_action :set_question

  def index
    @options = @question.options
  end

  def new
    @options = @question.options
    @option = @question.options.build()
  end

  def create
    @option = @question.options.build(option_params)
    if @option.save
      redirect_to new_option_path(question_id: @question.test.id)
    else
      render :new
    end
  end

  private

  def option_params
    params.require(:option).permit(:number, :title, :is_answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end

class OptionsController < BasesController
  before_action :set_question
  before_action :set_option, only: [:edit, :update, :destroy]

  def new
    @option = @question.options.build()
  end

  def create
    @option = @question.options.build(option_params)
    if @option.save
      redirect_to new_option_path(question_id: @question.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @option.update(option_params)
      redirect_to new_option_path(question_id: @question.id)
    else
      redirect_to edit_option_path(@option, question_id: @question.id)
    end
  end

  def destroy
    if @option.destroy
      redirect_to new_option_path(question_id: @question.id)
    else
      redirect_to new_option_path(question_id: @question.id)
    end
  end

  private

  def option_params
    params.require(:option).permit(:number, :title, :is_answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
    @options = @question.options
  end

  def set_option
    @option = @question.options.find(params[:id])
  end
end

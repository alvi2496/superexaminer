class OptionsController < BasesController
  before_action :set_question

  def new
    @options = @question.options
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

  def edit
    @options = @question.options
    @option = @options.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    if @option.save
      redirect_to new_option_path(question_id: @question.id)
    else
      render :new
    end
  end

  def destroy
    @option = Option.find(params[:id])
    if @option.destroy
      flash[:notice] = 'Option deleted'
    else
      flash[:alert] = 'Option not Deleted'
    end
    redirect_to new_option_path(question_id: @question.id)
  end

  private

  def option_params
    params.require(:option).permit(:number, :title, :is_answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end

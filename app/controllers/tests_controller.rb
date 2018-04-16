class TestsController < BasesController

  before_action :set_test, only: [:show, :edit, :update, :delete]

  def index
    if current_user.student?
      @all_tests = Test.all
      @registered_user_tests = current_user.tests.where('is_taken = false')
      @taken_user_tests = current_user.tests.where('is_taken = true')
    elsif current_user.teacher?
      @tests = current_user.tests
    end
  end

  def show; end

  def new
    @test = current_user.tests.build
  end

  def create
    @test = current_user.tests.build(test_params)
    if @test.save
      flash[:notice] = 'Test Saved'
    else
      flash[:alert] = 'Error saving test'
    end
    redirect_to dashboards_path
  end

  def edit; end

  def update
    if @test.update(test_params)
      flash[:notice] = 'Test updated'
    else
      flash[:alert] = 'Error updating test'
    end
    redirect_to dashboards_path
  end

  def destroy
    if @test.destroy
      flash[:notice] = 'Test deleted'
    else
      flash[:alert] = 'Error deleting test'
    end
    redirect_to dashboards_path
  end

  private

  def test_params
    params.require(:test).permit(:test_name, :course_code, :course_name, :full_mark,
                                 :date, :start_time, :duration, :syllabus)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end

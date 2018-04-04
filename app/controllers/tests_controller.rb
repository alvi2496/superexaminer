class TestsController < BasesController
  def index
    @tests = current_user.tests
  end

  def show

  end

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

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def test_params
    params.require(:test).permit(:test_name, :course_code, :course_name, :full_mark,
                                 :date, :start_time, :duration, :syllabus)
  end
end

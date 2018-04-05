class TestsController < BasesController
  def index
    @tests = Test.all.includes(:users)
  end

  def show
    @test = Test.find(params[:id])
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
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      flash[:notice] = 'Test updated'
    else
      flash[:alert] = 'Error updating test'
    end
    redirect_to dashboards_path
  end

  def destroy
    @test = Test.find(params[:id])
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
end
